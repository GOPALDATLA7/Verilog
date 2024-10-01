
module relational();
    reg a=4,b=10,w,x,y,z;
    initial
        begin
            w = a + b
            x = b - a;
            y = a * b;
            z = b % a;
            $display("w = %b,x = %b, y = %b, z = %b",w,x,y,z);
        end
endmodule