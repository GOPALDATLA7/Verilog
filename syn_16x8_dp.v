/*16x8 Synchronous dual port ram*/
//RTL
module syn_16x8_dp(din, dout, rd_addr,wr_addr,clk, we, re, rst);
    parameter width=8, depth=16, addr_bus=4;

    input [width-1:0] din;
    input [addr_bus-1:0] rd_addr, wr_addr;
    input clk, rst, we, re;
    output reg [width-1:0] dout;
    reg [width-1:0] mem [depth-1:0];

    integer i,j;

    always @(posedge clk)
    begin
        if (rst)
        begin
            dout<=0;
            for(i=0;i<16;i=i+1)
            mem[i]<=0;
        end
        else
        begin
            if (we==1)
                mem[wr_addr]<=din;
            if (re==1)
                dout<=mem[rd_addr];
        end 
    end 
endmodule

//TB
module syn_16x8_dp_tb( );
    reg[7:0]din;
    reg[3:0]rd_addr,wr_addr;
    reg clk,rst,we,re;
    wire[7:0]dout;
    
    syn_16x8_dp dut(din,dout,rd_addr,wr_addr,clk,we,re,rst);

    initial 
    begin
        clk=1'b0;
        forever
            #5 clk=~clk;
    end   

    task initialize;
    begin
        din=8'd0;
        {rd_addr,wr_addr}=8'd0;
        {rst,we,re}=3'b100;
    end   
    endtask

    task reset;
    begin
        @(negedge clk)
        rst=1'b1;
        @(negedge clk)
        rst=1'b0;
    end
    endtask

    task write(input[7:0]i,input[3:0]j,input k);
    begin
        @(negedge clk)
        din=i;
        wr_addr=j;
        we=k;
    end 
    endtask

    task read(input[3:0]m,input n);
    begin
        @(negedge clk)
        rd_addr=m;
        re=n;
    end 
    endtask

    initial 
    begin
        initialize;
        reset;
        #10 write({$random},4'b1011,1'b1);
        #10 read(4'b1011,1'b1);
    end
endmodule