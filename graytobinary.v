//RTL code for converting 4bit gray code to binary
//RTL
module g2b #(parameter WIDTH=4) (input [WIDTH-1:0] gray, output [WIDTH-1:0] binary);
    genvar i;
    assign binary[WIDTH-1]=gray[WIDTH-1];
    generate
        for(i=WIDTH-2;i>=0;i=i-1)
        begin
            assign binary[i]=gray[i]^binary[i+1];
        end 
    endgenerate
endmodule

//TB
module g2b_tb( );
    reg [3:0]gray;
    wire [3:0]binary;
    
    g2b DUT(gray,binary);
    initial
        begin
            $monitor("Gray = %b --> Binary = %b", gray, binary);
            gray = 4'b1110; #1;
            gray = 4'b0100; #1;
            gray = 4'b0111;
        end 
endmodule

/*
OUTPUT:
Gray = 1110 --> Binary = 1011
Gray = 0100 --> Binary = 0111
Gray = 0111 --> Binary = 0101*/