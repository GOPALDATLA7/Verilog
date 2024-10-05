//Mux 2to1
//RTL
module mux_2to1(
    input [1:0]I,
    input S,
    output Y);
    assign Y= S ? I[1] : I[0];
endmodule

//TB
module mux_2to1_tb( );
    reg [1:0]I;
    reg S;
    wire Y;
    mux_2to1 DUT(I,S,Y);
    initial
        begin
            I[0]=0;I[1]=1;
            S=0;
            #5 S=1;
            #5 $finish;
        end
endmodule
