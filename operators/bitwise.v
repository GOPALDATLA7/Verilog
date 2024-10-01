/*BITWISE OPERATOR*/
/*AND - & , OR - |, XOR - ^, NEGATION - ~,XNOR - ~^ or ^~*/
module bitwise();
    reg [2:0] a=5,b=3'b111,c=2,x,y,z;
    initial
        begin
            x = a & b;
            y = a | c;
            z = b ^ 0;
            $display("x = %b, y = %b, z = %b",x,y,z);
        end
endmodule
/*
Output: x=101, y=111, z=111
Explaination: Here the operation is done by bit by bit. let's take x 5 is 101 and b is 111, if we perform bitwise and the output is 101
*/