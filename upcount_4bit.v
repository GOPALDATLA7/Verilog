//4bit Synchronous Loadable up counter
/*It contains signals like Reset, Clock, [3:0]Data_in, Load, [3:0]count*/ 
/*If the reset is high then the count will reset to 0, else then if the load is applied then the count will start*/
//RTL
module upcount_4bit(
    input [4:0] data_in,
    input clk,rst,
    input load,
    output reg [3:0] count);
    
    always@(posedge clk)
        begin
            if(rst)
                count<=1'b0;
            else if(load)
                count<=data_in;
            else
                count<=count+1;
        end
endmodule

//TB
module upcount_4bit_tb( );
    reg [3:0]data_in;
    reg clk,rst,load;
    wire [3:0] count;

    upcount_4bit dut(data_in,clk,rst,load,count);

    initial
    begin
        forever 
            #5 clk=~clk;
    end

    task initialize;
        begin
            data_in=4'b0000;
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
            data_in=i;
        end
    endtask

    initial
    begin
        initialize;
        reset;
        load=1'b1;
        inputs(4'b0010);
        #10 load=1'b0;
        #300 $finish;
    end
endmodule
