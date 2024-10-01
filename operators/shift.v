/*SHIFT OPERATORS*/
/*Logical shift operators : << and >> Arithmetic shift operators : <<< and >>>*/
module shift();
    reg [3:0] a=4'b1001,b=4'b0111,w,x,y,z;
    initial
        begin
            w = a << 1
            x = b <<< 1;
            y = a >> 2;
            z = b >>> 2;
            $display("w = %b,x = %b, y = %b, z = %b",w,x,y,z);
        end
endmodule