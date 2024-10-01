/*LOGICAL OPEARTORS*/
/*AND - && , OR - || , NOT - !*/
module logical();
    reg a,b,c;
    reg x,y,z;
    initial
        begin
            a=3,b=5,c=x;
            x = a && b;
            y = a && c;
            z = b && 0;
            $display("x = %b, y = %b, z = %b",x,y,z);
        end
endmodule

/*
Output    x=1 , y=x, z=0
1-TRUE,  0-FALSE, X-UNKNOWN
Explaination: x=1 because both the inputs are high, y=x because one of the input is unknown, z=0 because one of the input is low so it fails.
*/