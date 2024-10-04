/*Decoder 2to4*/
//RTL
module decoder_2to4(
    input [1:0]d,
    output [3:0]y
    );
    
    assign y[0]=~d[1]&~d[0];
    assign y[1]=~d[1]&d[0];
    assign y[2]=d[1]&~d[0];
    assign y[3]=d[1]&d[0];
endmodule

//TB
module decoder_2to4_tb();
    reg [1:0]d;
    wire [3:0]y;
    decoder_2to4 DUT(d,y);
    initial
        begin
            d[1]=0;d[0]=0;
            #5 d[1]=0;d[0]=1;
            #5 d[1]=1;d[0]=0;
            #5 d[1]=1;d[0]=1;
            #5 $finish;
        end
endmodule