/*Priority encoder 8to3*/
//RTL
module pri_encode_8x3(input [7:0]in, output reg [2:0]y);

    always@(in)
    begin
        case(in)
            8'b1xxx_xxxx: y = 3'b111; 
            8'b01xx_xxxx: y = 3'b110; 
            8'b001x_xxxx: y = 3'b101; 
            8'b0001_xxxx: y = 3'b100; 
            8'b0000_1xxx: y = 3'b011; 
            8'b0000_01xx: y = 3'b010; 
            8'b0000_001x: y = 3'b001; 
            8'b0000_0001: y = 3'b000; 
            default: $display("Invalid data received"); 
        endcase
    end
endmodule

//TB
module pri_encode_8x3_tb();
    reg [7:0]in;
    wire [2:0]y;

    pri_encode_8x3 dut(.in(in),.y(y));
    
    initial 
    begin
        $monitor("in=%b y=%b",in,y);
        repeat(5) begin
            in=$random; #5;
        end
    end
endmodule

/*Output:
in=10000001 y=111
in=01001000 y=110
in=00100100 y=101
in=00010110 y=100
in=00000100 y=010*/