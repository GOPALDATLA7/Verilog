//D Flip Flop
//RTL
/*The Q_out will be same as d_in, and Qbar should be complement of Q_out*/
module dff(clock,reset,d_in,Q_out,Qb_out);

    input clock,d_in,reset;
    output reg Q_out;
    output Qb_out;

    always@(posedge clock)
        begin
            if(reset)
                Q_out <= 1'b0;
            else
                Q_out <= d_in;
        end
    
    assign Qb_out =~ Q_out;
endmodule

//TB
module dff_tb();
    reg clk,reset,d;
    wire q,qb;
    
    parameter CYCLE=10;
        
    dff DUT(clk,reset,d,q,qb);
   
    always
        begin
            #(CYCLE/2);
            clk = 1'b0;
            #(CYCLE/2);
            clk=~clk;
        end

    task rst_dut();
        begin
            @(negedge clk);
            reset=1'b1;
            @(negedge clk);
            reset=1'b0;
        end
    endtask

    task din(input i);
        begin
            @(negedge clk);
            d=i;
        end
    endtask

    initial
        begin
            rst_dut;
            din(0);
            din(1);
            din(0);
            din(1);
            din(1);
            rst_dut;
            din(0);
            din(1);
            #10;
            $finish;
        end

    initial
        begin
            $monitor("Values of clk=%b,reset=%b,data=%b,q=%b,qb=%b",clk,reset,d,q,qb);
        end

    initial
        begin
            $fsdbDumpvars(0,dff_tb);
        end
endmodule