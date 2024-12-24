/*FSM for detecting 101 sequence using Moore for an non overlapping.
We use 4 states here S0, S1, S2, S3.*/
//RTL
module seq_det(seq_in,clock,reset,det_o);

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    input seq_in, clock, reset;
    output det_o;

    reg [1:0]state,next_state;

    always@(posedge clock,posedge reset)
        begin
            if(reset)
                state <= S0;
            else
                state <= next_state;
        end

    always@(state,seq_in)
        begin
            case(state)
                S0 : if(seq_in==1)
                        next_state=S1;
                     else
                        next_state=S0;
                S1 : if(seq_in==0)
                        next_state=S2;
                     else
                        next_state=S1;
                S2 : if(seq_in==1)
                        next_state=S3;
                     else
                        next_state=S0;
                S3 : if(seq_in==1)
                        next_state=S1;
                     else
                        next_state=S2;
                default: next_state=S0;
            endcase
        end
    assign det_o = (state = S3)? 1'b1 :1'b0;
endmodule

//TB
module seq_det_tb();
    reg  din,clock,reset;
    wire dout;

    parameter CYCLE = 10;

    seq_det SQD(.seq_in(din),.clock(clock),.reset(reset),.det_o(dout));

    always
        begin
            #(CYCLE/2);
            clock = 1'b0;
            #(CYCLE/2);
            clock=~clock;
        end

    task initialize(input din);
        begin
            din=0;
        end
    endtask
   
    task delay(input integer i);
        begin
            #i;
        end
   endtask

    task RESET();
        begin
            delay(5);
            reset=1'b1;
            delay(10);
            reset=1'b0;
        end
    endtask

    task stimmulus(input data);
        begin
            @(negedge clock);
            din = data;
        end
    endtask

    initial
        $monitor("Reset=%b, state=%b, Din=%b, Output Dout=%b",reset,SQD.state,din,dout);

    always@(SQD.state or dout)
        begin
            if(SQD.state==2'b11 && dout==1)
                $display("Correct output at state %b", SQD.state);
        end

    initial
        begin
            initialize;
            RESET;
            stimulus(0);
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(1);
            RESET;
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(1);
            delay(10);
            $finish;
        end

    initial
        begin
            $fsdbDumpvars(0,seq_det_tb);
        end
endmodule