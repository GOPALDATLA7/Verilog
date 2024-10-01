module logical();
    reg a,b,c;
    reg x,y,z;
    initial
        begin
            a=3,b=5,c=x;
            x = a && b;
            y = a && c;
            z = b && 0;
            $display("x = %b, y = %b, z = %b",x,y,z);
        end
endmodule