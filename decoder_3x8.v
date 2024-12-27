/*Decoder 3x8*/
//RTL
module decoder_3x8(input [2:0]in, input en, output reg [7:0]out);
    always@(in,en)
    begin
        if(en==1)
        begin
            case(in)
                3'b000: out=8'b00000000;
                3'b001: out=8'b00000001;
                3'b010: out=8'b00000010;
                3'b011: out=8'b00000011;
                3'b100: out=8'b00000100;
                3'b101: out=8'b00000101;
                3'b110: out=8'b00000110;
                3'b111: out=8'b00000111;
                default: out=8'bz;
            endcase
        end
        else
            out=8'b00000000;
    end
endmodule

//TB
module decoder_3x8_tb( );
    reg [2:0]in;
    reg en;
    wire [7:0]out;

    decoder_3x8 dut(in,en,out);

    task enable(input e);
        begin
            en=e;
        end
    endtask

    task initialize;
        begin
            {in}=0;
        end
    endtask

    task inputs(input [2:0]i);
        begin
            in=i;
        end
    endtask 

    initial
        begin
            initialize;
            enable(1);
            inputs(000);
            #10 inputs(010);
            #10 inputs(011);
            #10 inputs(100);
            #10 inputs(110);
            #10 inputs(111);
            #10 inputs(101);
        end

    initial 
        $monitor("in=%b,en=%b,out=%b",in,en,out);
    initial
        #100 $finish;
endmodule

/*Output:
in=000,en=1,out=00000000
in=010,en=1,out=00000010
in=011,en=1,out=00000011
in=100,en=1,out=00000100
in=110,en=1,out=00000110
in=111,en=1,out=00000111
in=101,en=1,out=00000101*/