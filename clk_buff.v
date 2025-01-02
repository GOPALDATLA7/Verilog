/*Clock buffer*/
//RTL
module clkbuff(input mclk,output bclk);
    buf b1(bclk,mclk);
endmodule

//TB
module clkbuff_tb( );
    reg mclk;
    wire bclk;
    realtime t1,t2,t3,t4,t5,t6;

    clkbuff dut(mclk,bclk);

    initial begin
        mclk=1'b0;
        forever #10 mclk=~mclk;
    end

    task master;
    begin
        @(posedge mclk) 
        t1=$realtime;
        @(posedge mclk) 
        t2=$realtime;
        t3=t2-t1;
    end
    endtask

    task bufout;
    begin 
        @(posedge bclk) 
        t4=$realtime;
        @(posedge bclk) 
        t5=$realtime;
        t6=t5-t4;
    end
    endtask
 
    task freq_phase;
        realtime f,p;
        begin
            f=t6-t3;
            p=t4-t1;
            $display("freq_diff=%0t, phase_diff=%0t", f,p);
        end
    endtask
 
    initial 
    begin
        fork 
            master;
            bufout;
        join
        freq_phase;
    end
endmodule