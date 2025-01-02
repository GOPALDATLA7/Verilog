/*Asynchronous 8x16 dual port ram*/
//RTL
module as8x16dp(din,dout,rd_addr,wr_addr,wr_clk,rd_clk,we,re,clr);
    parameter width=16,depth=8,addr_bus=3;
    input[width-1:0]din;
    input[addr_bus-1:0]rd_addr,wr_addr;
    input wr_clk,rd_clk,clr,we,re;
    output reg[width-1:0]dout;
    reg[width-1:0]mem[depth-1:0];

    integer i;  

    always@(posedge wr_clk,posedge clr)
    begin
        if(clr)
        begin
            for(i=0;i<8;i=i+1)
            begin
                mem[i]<=0;
            end
        end
        else if(we)  
            mem[wr_addr]<=din;
    end 

    always@(posedge rd_clk,posedge clr)
    begin
        if(clr)
            dout<=0;
        else if(re)   
            dout<=mem[rd_addr];
    end  
endmodule

//TB
module as8x16dp_tb( );
    reg[15:0]din;
    reg[2:0]rd_addr,wr_addr;
    reg wr_clk,rd_clk,clr,we,re;
    wire[15:0]dout;

    as8x16dp dut(din,dout,rd_addr,wr_addr,wr_clk,rd_clk,we,re,clr);

    initial
    begin
        wr_clk=1'b0;
        forever
            #5 wr_clk=~wr_clk;
    end

    initial
    begin
        rd_clk=1'b0;
        forever
        #5 rd_clk=~rd_clk;
    end

    task initialize;
    begin
        din=16'd0;
        {rd_addr,wr_addr}=6'd0;
        {clr,we,re}=3'b100;
    end
    endtask

    task wr_clear;
    begin
        @(negedge wr_clk);
        clr=1'b1;
        #20 @(negedge wr_clk);
        clr=1'b0;
    end  
    endtask

    task write(input[15:0]i,input[2:0]j,input k);
    begin
        @(negedge wr_clk);
        din=i;
        wr_addr=j;  
        we=k;
    end
    endtask

    task read(input[2:0]m,input n);
    begin
        @(negedge rd_clk) rd_addr=m;re=n;
    end
    endtask

    initial
    begin
        initialize;
        wr_clear;
        #10 write({$random},3'b101,1'b1);
        #10 read(3'b101,1'b1);
    end
endmodule