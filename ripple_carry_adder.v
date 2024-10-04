//Ripple Carry Adder
//RTL
/*full adder*/
module full_adder(
    input a,b,cin,
    output sum,carry);
    
    assign sum = a^b^cin;
    assign carry = (a&b)|(cin&b)|(a&cin);
endmodule
/*Ripple carry code using full adder*/
module ripple_carry_adder(
    input [3:0] a,b,
    input cin,
    output [3:0]sum,
    output carry
    );
    wire c1,c2,c3;
    full_adder FA1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(c1));
    full_adder FA2(.a(a[1]),.b(b[1]),.cin(c1),.sum(sum[1]),.carry(c2));
    full_adder FA3(.a(a[2]),.b(b[2]),.cin(c2),.sum(sum[2]),.carry(c3));
    full_adder FA4(.a(a[3]),.b(b[3]),.cin(c3),.sum(sum[3]),.carry(carry));
endmodule

//TB
module ripple_carry_adder_tb();
    reg [3:0] a,b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    ripple_carry_adder DUT(a,b,cin,sum,carry);
    
    initial
        begin
            cin = 0;
            a = 4'b0110;
            b = 4'b1100;
            #10
            a = 4'b1110;
            b = 4'b1000;
            #10
            a = 4'b0111;
            b = 4'b1110;
            #10
            a = 4'b0010;
            b = 4'b1001;
            #10 $finish();
        end
endmodule