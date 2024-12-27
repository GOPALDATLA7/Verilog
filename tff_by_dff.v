/*T flip flop by using D flip flop*/
//RTL

//D Flip flop
module dff(d,clk,rst,q);
    input d,clk,rst;
    output reg q;

    always@(posedge clk)
    begin
        if(rst)
            q<=1'b0;
        else
            q<=d;
    end
endmodule

//T flip flop using D
module tff_by_dff(t,clk,rst,q);
    input t,clk,rst;
    output q;
 
    wire w1;
    xor x1(w1,t,q);
    dff d1(w1,clk,rst,q);
endmodule


//TB
module tff_by_dff_tb( );
    reg t,clk,rst;
    wire q;

    tff_by_dff dut(t,clk,rst,q);

    initial 
    begin
        clk=1'b0;
        forever
            #5 clk=~clk;
    end 

    task initialize;
    begin
        t=0;
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

    task inputs(input i);
    begin
        @(negedge clk)
        t=i;
    end 
    endtask

    initial 
    begin
        initialize;
        reset;
        inputs(1'b0);
        #10 inputs(1'b1);
        #10 $finish;
    end
endmodule