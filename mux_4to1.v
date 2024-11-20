//Design 4:1 mux using 2:1mux
//RTL
module mux_2to1(
    input I0,I1,
    input S,
    output Y);
    assign Y=S ? I1:I0;
endmodule

module mux_4to1(
    input I0,I1,I2,I3,
    input S0,S1,
    output Y);
    wire y1,y2;
    mux_2to1 M1(.I0(I0),.I1(I1),.S(S1),.Y(y1));
    mux_2to1 M2(.I0(I2),.I1(I3),.S(S1),.Y(y2));
    mux_2to1 M3(.I0(y1),.I1(y2),.S(S0),.Y(Y));
endmodule

//TB
module mux_4to1_tb();
    reg I0,I1,I2,I3;
    reg S0,S1;
    wire Y;
    
    mux_4to1 mux(I0,I1,I2,I3,S0,S1,Y);
    
    initial
        begin
            $monitor("S0=%b,S1=%b,-> I0=%0b,I1=%0b,I2=%0b,I3=%0b -> Y=%0b",S0,S1,I0,I1,I2,I3,Y);
            {I0,I1,I2,I3}=4'h5;
            repeat(6) begin
                {S1,S0} = $random;
                 #5;
            end
            #100 $finish;
        end
endmodule