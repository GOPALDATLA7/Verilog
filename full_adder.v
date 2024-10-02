//Full Adder
//RTL
module full_adder(
    input a,b,cin,
    output sum,carry);
    
    assign sum = a^b^cin;  //Xor Operation
    assign carry = (a&b)|(cin&b)|(a&cin);
endmodule

//TB
module full_adder_tb();
reg a,b,cin;
wire sum,carry;
full_adder DUT(a,b,cin,sum,carry);
initial
    begin
        a=0;b=0;cin=0;
        #10 a=0;b=0;cin=1;
        #10 a=0;b=1;cin=0;
        #10 a=0;b=1;cin=1;
        #10 a=1;b=0;cin=0;
        #10 a=1;b=0;cin=1;
        #10 a=1;b=1;cin=0;
        #10 a=1;b=1;cin=1;
        #10 $finish;
    end
endmodule
