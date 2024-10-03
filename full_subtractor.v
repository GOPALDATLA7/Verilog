//Full Subtractor
//RTL
module full_subtractor(
    input a,b,cin,
    output diff,borrow);
    
    assign diff = a^b^cin;
    assign borrow = (~a&b)|(b&cin)|(~a&cin);
endmodule

//TB
module full_subtractor_tb();
    reg a,b,cin;
    wire diff,borrow;
    
    full_subtractor DUT(a,b,cin,diff,borrow);
    
    initial
        begin
            a=0;b=0;cin=0;
            #10 a=0;b=0;cin=1;
            #10 a=0;b=1;cin=0;
            #10 a=0;b=1;cin=1;
            #10 a=1;b=0;cin=0;
            #10 a=1;b=0;cin=1;
            #10 a=1;b=1;cin=0;
            #10 a=1;b=1;cin=1;
            #10 $finish;
        end
endmodule