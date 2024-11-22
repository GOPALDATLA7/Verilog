//Synchronous 16X8 dual port ram 
/* Depth - 16, Width - 8
Data is 8 bit and the address is 4 bit
reset, clk, read, write is single bit
INPUTS : clk, reset, write, read, write_address, read_address, data_in
OUTPUTS : data_out*/

//RTL
module syn_16x8(clk,reset,read,write,read_addr,write_addr,data_in,data_out);
    parameter RAM_WIDTH = 8;
    parameter RAM_DEPTH = 16;
    parameter ADDR_SIZE = 4;
    
    input clk,reset,read,write;
    input [ADDR_SIZE-1:0] read_addr, write_addr;
    input [RAM_WIDTH-1:0] data_in;
    output reg [RAM_WIDTH-1:0] data_out;
    integer i; 
    
    reg [RAM_WIDTH-1:0] mem [RAM_DEPTH-1:0];
    
    always@(posedge clk)
        begin
            if(reset)
                begin
                    data_out <= 0;
                    for(i=0;i<RAM_DEPTH;i=i+1)
                        mem[i] <= 0;
                end 
            else
                begin
                    if(write)
                        mem[write_addr] <= data_in;
                    if(read)
                        data_out <= mem[read_addr];
                end 
        end
endmodule

//TB
module syn_16x8_tb( );

    parameter RAM_WIDTH = 8;
    parameter RAM_DEPTH = 16;
    parameter ADDR_SIZE = 4;
    
    reg clk,reset,read,write;
    reg [ADDR_SIZE-1:0] read_addr, write_addr;
    reg [RAM_WIDTH-1:0] data_in;
    wire [RAM_WIDTH-1:0] data_out;
    integer i;
    
    syn_16x8 DUT(clk,reset,read,write,read_addr,write_addr,data_in,data_out);
    
    always
        begin
            #5 clk=~clk;
        end 
       
    task reset_t;
        begin
            @(negedge clk);
            reset = 1'b1;
            @(negedge clk);
            reset = 1'b0;
        end
    endtask
    
    task write_t(input [7:0]a, input [3:0]b, input w,r);
        begin
            @(negedge clk);
            write = w;
            read = r;
            write_addr = b;
            data_in = a;
        end
    endtask

    task read_t(input [3:0]a, input r,w);
        begin
            @(negedge clk);
            write = w; 
            read = r;
            read_addr = a;
        end       
    endtask
    
    initial
        begin
            clk = 1'b0;
            reset_t;
            repeat(10)
                write_t({$random}%256,{$random}%16,1'b1,1'b0);
            repeat(10)
                read_t({$random}%16,1'b1,1'b0);
            #100 $finish;
        end
endmodule