/*Bidirectional buffer*/
//RTL
module bidirectional_buff(inout a,b,input ctr);
    bufif1 b1(b,a,ctr);
    bufif0 b2(a,b,ctr); 
endmodule

//TB
module bi_directional_buff_tb( );
    wire a,b;
    reg ctr;
    reg tempa,tempb;
    integer i;

    bidirectional_buff dut(a,b,ctr);
    
    assign a=ctr?tempa:1'bz;
    assign b=~ctr?tempb:1'bz;

    initial
    begin
        for(i=0;i<8;i=i+1)
        begin
            {tempa,tempb,ctr}=i;
            #10;
        end
    end
    initial
        $monitor("a=%b,b=%b,ctrl=%b",a,b,ctr);
    initial
        #100 $finish;
endmodule

/*Output:
a=0,b=0,ctrl=0
a=0,b=0,ctrl=1
a=1,b=1,ctrl=0
a=0,b=0,ctrl=1
a=0,b=0,ctrl=0
a=1,b=1,ctrl=1
a=1,b=1,ctrl=0
a=1,b=1,ctrl=1*/