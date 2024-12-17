//Verilog Code for Converting binary to gray, Here we took 4bit.
//RTL
module b2g #(parameter WIDTH=4) (input [WIDTH-1:0] binary, output [WIDTH-1:0] gray);
    genvar i;
    generate
        for(i=0;i<WIDTH-1;i++)
            assign gray[i]=binary[i]^binary[i+1];
    endgenerate
    assign gray[WIDTH-1]=binary[WIDTH-1];
endmodule

//TB
module TB; 
    reg [3:0] binary, gray; 
    b2g DUT(binary, gray); 
    initial begin 
        $monitor("Binary = %b --> Gray = %b", binary, gray); 
        binary = 4'b1011; #1; 
        binary = 4'b0111; #1; 
        binary = 4'b0101; #1; 
        binary = 4'b1100; #1; 
        binary = 4'b1111; 
    end 
endmodule 