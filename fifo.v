/*A synchronous FIFO 8 bit wide, 16 deep.
Inputs: clock, reset, data_in, read_n and write_n.
Outputs: data_out, full, empty.*/
//RTL
module fifo(input clk,rst,re,we,input [7:0]data_in, output empty,full,output reg [7:0]data_out);

    reg [3:0] wr_pt=4'b0;
    reg [3:0] rd_pt=4'b0;

    reg [7:0]mem[15:0];
    integer i;  

    //pointers are in same location you can write data into memory
    assign empty=(wr_pt==rd_pt)? 1'b1:1'b0;
    //write pointer is at last memory location and read in starting stop we cannot write so first fetch the data out
    assign full= (wr_pt==4'b1111 && rd_pt==4'd0) ? 1'b1:1'b0;

    always @(posedge clk)
    begin
        if(rst)
            begin
                for(i=0;i<16;i=i+1)
                begin
                    mem[i]<=0;
                    wr_pt<=4'b0;
                end 
            end  
        //if write mode and full is 0 load into fsm
        else if ((we==1'b1) && (full==1'b0))
            begin
                mem[wr_pt]<=data_in;
                wr_pt<=wr_pt+1;
            end 
        //else pointer in same location
        else
            wr_pt<=wr_pt;
    end 

    //reading operation from fifo
    always @(posedge clk)
    begin
        if(rst) 
        begin
            rd_pt<=4'b0;
            data_out<=8'b0;
        end 
        else if((re==1'b1) && (empty==1'b0))
        begin  
            data_out<=mem[rd_pt];
            rd_pt<=rd_pt+1;
        end 
        else 
            rd_pt<=rd_pt;
    end   
endmodule

//TB
module fifo_tb();
    reg clk,rst,re,we;  
    reg [7:0]data_in;
    wire empty,full;
    wire [7:0]data_out;

    fifo dut(clk,rst,re,we,data_in,empty,full,data_out);

    initial begin
        clk =1'b0;
        forever #5 clk=~clk;
    end

    task reset;
    begin
        @(negedge clk)
        rst=1'b1;
        @(negedge clk)
        rst=1'b0;
    end 
    endtask

    task write(input [7:0]i);
    begin
        we=1'b1;
        re=1'b0;
        data_in=i;
    end
    endtask

    task read;
    begin
        re=1'b1;
        we=1'b0;
    end
    endtask
      
    initial
    begin
        reset;
        #10 write(($random));
        #10 write(($random));
        #10 write(($random));
        #10 write(($random));
        #10 read;
        #10 read;
        #10 read;
        #10 read;
        #10 $finish;
    end
endmodule