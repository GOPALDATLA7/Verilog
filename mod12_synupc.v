/*4 bit MOD-12 loadable binary Synchronous up counter*/
//RTL
module mod12_synupc(input [3:0] in, input clk,rst,load, output reg [3:0] out);
    
    always@(posedge clk)
    begin
        if(rst)
            out<=0;
        else if(out>11)
            out<=0;
        else if(load)
            out<=in;
        else
            out<=out+1;
    end
endmodule

//TB
module mod12_synupc_tb();
    reg [3:0]in;
    reg clk,rst,load;
    wire [3:0]out;

    mod12_synupc dut(in,clk,rst,load,out);

    initial
    begin
        forever
        #5 clk=~clk;
    end

    task initialize;
    begin
        in=4'b0000;
        clk=0;
        rst=1;
        load=0;
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

    task inputs(input [3:0]i);
    begin
        @(negedge clk)
        in=i;
    end
    endtask

    initial
    begin
        initialize;
        reset;
        load=1'b1;
        inputs(4'b0001);
        #10 load=1'b0;
        #150 $finish;
    end
endmodule