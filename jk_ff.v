/*JK flip flop using parameter declaration(Hold, Reset, Set, Toggle)*/
//RTL
module jk_ff(input j,k,clk,rst, output reg q);
    
    parameter Hold=2'b00;
    parameter Reset=2'b01;
    parameter Set=2'b10;
    parameter Toggle=2'b11;
    
    always@(posedge clk)
    begin
        if(rst)
            q<=1'b0;
        else
            case({j,k})
                Hold    :   q<=q;
                Set     :   q<=1'b1;
                Reset   :   q<=1'b0;
                Toggle  :   q<=~q;
            endcase
    end
endmodule

//TB
module jk_ff_tb( );
    reg j,k,clk,rst;
    wire q;

    jk_ff dut(j,k,clk,rst,q);

    initial begin
        clk=1'b0;
        forever #5 clk=~clk;
    end 

    task initialize;
    begin
        {j,k}=0;
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

    task inputs(input [1:0]i);
    begin
        @(negedge clk)
        {j,k}=i;
    end
    endtask

    initial 
    begin
        initialize;
        reset;
        inputs(00);
        #10 inputs(01);
        #10 inputs(10);
        #10 inputs(11);
        #10 $finish;
    end 
endmodule