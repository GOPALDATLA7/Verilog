//Full Adder rtl using two half Adder
//RTL
/*half_adder*/
module half_adder(
    input a,b,
    output sum,carry
    );
    
    assign sum = a^b;  //Xor Operation
    assign carry = a&b; //And operation
endmodule

/*full_adder*/
module full_adder(
	input a,b,cin,
	output sum,carry);

	wire w1,w2,w3;

	half_adder HA1(.a(a),.b(b),.sum(w1),.carry(w2));
	half_adder HA2(.a(w1),.b(cin),.sum(sum),.carry(w3));
	or OR1(carry,w2,w3);
endmodule


//TB
module full_adder_tb();
   reg   a,b,cin;
   wire  sum,carry;

   full_adder DUT(a,b,cin,sum,carry);   

   integer i;

   initial
      begin
         a   = 1'b0;
         b   = 1'b0;
         cin = 1'b0;
      end
   initial
      begin
         for (i=0;i<8;i=i+1)
            begin
               {a,b,cin}=i;
               #10;
            end
      end
   initial
      $monitor("Input a=%b, b=%b, c=%b, Output sum =%b, carry=%b",a,b,cin,sum,carry);
   initial #100 $finish;
endmodule


/*Output Statements as we used $monitor here
Input a=0, b=0, c=0, Output sum =0, carry=0
Input a=0, b=0, c=1, Output sum =1, carry=0
Input a=0, b=1, c=0, Output sum =1, carry=0
Input a=0, b=1, c=1, Output sum =0, carry=1
Input a=1, b=0, c=0, Output sum =1, carry=0
Input a=1, b=0, c=1, Output sum =0, carry=1
Input a=1, b=1, c=0, Output sum =0, carry=1
Input a=1, b=1, c=1, Output sum =1, carry=1*/