/*Rtl for 8to1 mux using case statement*/
//RTL 
module mux_8to1(
    input [7:0] din,
    input [2:0] s,
    output reg dout
    );
    always@(*)
    begin
        case(s)
            3'b000 : dout = din[0];
            3'b001 : dout = din[1];
            3'b010 : dout = din[2];
            3'b011 : dout = din[3];
            3'b100 : dout = din[4];
            3'b101 : dout = din[5];
            3'b110 : dout = din[6];
            3'b111 : dout = din[7];
            default : dout = 1'b0;
        endcase
    end     
endmodule

//TB
module mux_8to1_tb( );
reg [7:0] din;
reg [2:0]s;
wire dout;

mux_8to1 DUT(din,s,dout);

initial 
begin
    $monitor("s = %0b -> din= %0b -> dout=%0b",s,din,dout);
    din = 25;
    repeat(6)
        begin
            s = $random;
            #5;
        end 
     #50 $finish;
end
endmodule

/*output:
# run 1000ns
s = 100 -> din= 11001 -> dout=1
s = 1 -> din= 11001 -> dout=0
s = 11 -> din= 11001 -> dout=1
s = 101 -> din= 11001 -> dout=0*/