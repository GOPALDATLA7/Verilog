//Encoder 4to2
//RTL
module encoder_4to2(
    input [3:0]d,
    output [1:0]y
    );
    
    assign y[0]=d[1]|d[3];
    assign y[1]=d[2]|d[3];
endmodule

//TB
module encoder_4to2_tb();
    reg [3:0]d;
    wire [1:0]y;
    encoder_4to2 DUT(d,y);
    initial
        begin
            d[3]=0;d[2]=0;d[1]=0;d[0]=1;
            #5 d[3]=0;d[2]=0;d[1]=1;d[0]=0;
            #5 d[3]=0;d[2]=1;d[1]=0;d[0]=0;
            #5 d[3]=1;d[2]=0;d[1]=0;d[0]=0;
            #5 $finish;
        end
endmodule