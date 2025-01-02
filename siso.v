/*4bit right shift serial in serial out(SISO)*/
//RTL
module siso(clk,rst,sin,sout);
    input clk,rst,sin;
    output reg sout;
    
    reg[3:0]temp;

    always@(posedge clk)
    begin
        if(rst)
            temp<=4'b0;
        else
        begin 
            temp<={sin,temp[3:1]};
            sout<=temp[0];
        end   
    end
endmodule

//TB
module siso_tb();
    reg clk,rst,sin;
    reg[3:0]temp;
    wire sout;
    
    siso uut(clk,rst,sin,sout);

    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end  

    task initialize;
    begin 
        {sin,rst}=0;
    end   
    endtask

    task reset;
    begin
        @(posedge clk)
        rst=1'b1;
        @(posedge clk)
        rst=1'b0;
    end   
    endtask

    task inputs(input i);
    begin
        @(posedge clk)
        sin=i;
    end 
    endtask

    initial
    begin
        initialize;
        reset;
        inputs(1);
        #10 inputs(0);
        #10 inputs(1);
        #10 inputs(0);
        #50 $finish;
    end 
endmodule