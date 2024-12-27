/*SR Latch with gate level modelling*/
//RTL
module sr_latch(
    input r,s,
    input q,q_bar
    );
    nand(q, r, q_bar); 
    nand(q_bar, s, q);
endmodule

//TB
module sr_latch_tb( );
    reg r,s;
    wire q, q_bar;
    
    sr_latch DUT(r,s,q,q_bar);
    
    initial
    begin
        r=1'b1; s=1'b1;
        $monitor("r = %0b, s = %0b -> q = %0b, q_bar = %0b",r,s,q,q_bar);
        #10 r=1'b1; s=1'b0;
        #10 r=1'b1; s=1'b1;
        #10 r=1'b0; s=1'b1;
        #10 r=1'b0; s=1'b0;
        #10 r=1'b1; s=1'b1;
        #10 r=1'b0; s=1'b1;  
        #10 $finish;
    end
endmodule

/*Output:
r = 1, s = 1 -> q = x, q_bar = x
r = 1, s = 0 -> q = 0, q_bar = 1
r = 1, s = 1 -> q = 0, q_bar = 1
r = 0, s = 1 -> q = 1, q_bar = 0
r = 0, s = 0 -> q = 1, q_bar = 1
r = 1, s = 1 -> q = 1, q_bar = 0
r = 0, s = 1 -> q = 1, q_bar = 0*/