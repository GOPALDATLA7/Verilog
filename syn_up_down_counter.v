/*4 bit Synchronous up down counter
Mode - 0 : Down count
Mode - 1 : Up count*/
//RTL
module syn_up_down_counter(input [3:0] in, input clk,rst, input load,mode, output reg [3:0] out);
    always@(posedge clk)
    begin
        if(rst)
            out<=0;
        else if(load)
            out<=in;
        else if(mode)
            out<=out+1;
        else
            out<=out-1;
    end 
endmodule

//TB
module syn_up_down_counter_tb( );
    reg [3:0]in;
    reg clk,rst,load,mode;
    wire [3:0]out;

    syn_up_down_counter dut(in,clk,rst,load,mode,out);

    task initialize;
    begin
        in=4'b0000;
        rst=1'b1;
        load=1'b0;
    end
    endtask

    initial
    begin
        clk=1'b0;
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

    task modes(input j);
    begin
        @(negedge clk)
        mode=j;
    end
    endtask

    task loads(input f);
    begin
        @(negedge clk)
        load=f;
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
        loads(1);
        inputs(2);
        modes(0);
        #10 loads(0);
        #100 modes(1);
        #200 $finish;
    end
endmodule