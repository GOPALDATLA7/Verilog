/*RELATIONAL OPERATORS*/
/*< <= >= >*/
module relational();
    reg [3:0]a=4,b=10;
    reg w,x,y,z;
    initial
        begin
            w = a < b;
            x = b <= a;
            y = a > b;
            z = b >= a;
            $display("w = %b,x = %b, y = %b, z = %b",w,x,y,z);
        end
endmodule

/* Output:  w=1, x=0, y=0, z=1
Explanation: If the relation between both the operands is true then the output is HIGH else LOW*/
