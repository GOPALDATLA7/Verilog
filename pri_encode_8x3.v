/*Priority encoder 8to3*/
//RTL
module pri_encode_8x3(input en, input [7:0]in, output reg [2:0]out);

    always@(en,in)
    begin
        if(en==1)
            begin
                if(in[7]==1) out=3'b111;
                else if(in[6]==1'b1) out=3'b110;
                else if(in[5]==1'b1) out=3'b101;
                else if(in[4]==1'b1) out=3'b100;
                else if(in[3]==1'b1) out=3'b011;
                else if(in[2]==1'b1) out=3'b010;
                else if(in[1]==1'b1) out=3'b001;
                else if(in[0]==1'b1) out=3'b000;
            end
        else
            begin
                out=3'bzzz;
            end
    end
endmodule

//TB
module pri_encode_8x3_tb();
    reg [7:0]in;
    reg en;
    wire [2:0]out;
    integer i;

    pri_encode_8x3 dut(.en(en),.in(in),.out(out));
    
    initial 
    begin
        $monitor("en=%b i=%b y=%b",en,in,out);
        en=1; in=128;
        #10 en=1; in=64;
        #10 en=1; in=32;
        #10 en=1; in=16;
        #10 en=1; in=4;
        #10 en=1; in=8;
        #10 en=0;in=8'bx;
        #10 $finish;
    end
endmodule

/*Output:
en=1 i=10000000 y=111
en=1 i=01000000 y=110
en=1 i=00100000 y=101
en=1 i=00010000 y=100
en=1 i=00000100 y=010
en=1 i=00001000 y=011
en=0 i=xxxxxxxx y=zzz*/