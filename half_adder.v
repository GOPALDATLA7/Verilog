//Half Adder
//RTL
module half_adder(
    input a,b,
    output sum,carry
    );
    
    assign sum = a^b;  //Xor Operation we can also write it as Xor(sum,a,b)
    assign carry = a&b; //And operation can also written in And(carry,a,b)
endmodule

//TB
module half_adder_tb();
reg a,b;
wire sum,carry;
half_adder dut(a,b,sum,carry);
initial
    begin
        a=0;b=0;
        #10 a=0;b=1;
        #10 a=1;b=0;
        #10 a=1;b=1;
        #10 $finish;
    end
endmodule