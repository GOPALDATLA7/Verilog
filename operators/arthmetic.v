/*ARTHMETIC OPERATIONS*/
module arthmetic();
    reg [3:0]a=4,b=10,w,x,y,z;
    initial
        begin
            w = a + b;
            x = b - a;
            y = a * b;
            z = b % a;
            $display("w = %b,x = %b, y = %b, z = %b",w,x,y,z);
        end
endmodule
/*
Output: w = 0111,x = 1111, y = 1100, z = 0011*/
