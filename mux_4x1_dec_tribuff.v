/*Rtl for 4x1 Mux using Decoder and tristate buffers and verify using a testbench*/
//RTL

//Decoder 2to4
module decoder(input[1:0]a ,output[3:0]y);
    assign y[0] = (~a[0] & ~a[1]);
    assign y[1] = (~a[0] & a[1]);
    assign y[2] = (a[0] & ~a[1]);
    assign y[3] = (a[0] & a[1]);
endmodule

//tristate buffer
module tri_buff(input a, en, output reg y);
    always@(*)
    begin
        if(en) 
            y=a;
        else 
            y =1'bz;
    end
endmodule

module mux_4to1_dec_tribuff(input[3:0] a,input[1:0] s,output y);
    wire [3:0] w,t;
    assign y = t[s];
    decoder D1(s,w);
    tri_buff B1(a[0],w[0],t[0]);
    tri_buff B2(a[1],w[1],t[1]);
    tri_buff B3(a[2],w[2],t[2]);
    tri_buff B4(a[3],w[3],t[3]);
endmodule


//TB
module mux_4to1_dec_tribuff_tb( );
    reg [3:0]a;
    reg [1:0]s;
    wire y;
    wire x;
    integer i;
    
    mux_4to1_dec_tribuff DUT(a,s,y);
    
    initial 
    begin
        for(i=0;i<64;i=i+1)
        begin
            {s,a}=i;
            #10;
        end
    end
    initial
    #800 $finish;
endmodule