// Conustruct mux 4:1
//RTL
module mux4_1(data_in,
              sel_in,
              y_out);

        input [3:0] data_in;
        input [1:0]sel_in;
        output reg y_out;
   
        always@(data_in,sel_in)
                begin
                        case(sel_in)
                                2'd0   : y_out = data_in[0];
                                2'd1   : y_out = data_in[1];
                                2'd2   : y_out = data_in[2];
                                2'd3   : y_out = data_in[3];
                                default: y_out = 0;
                        endcase
                end
endmodule

//TB
module mux4_1_tb();
    reg [3:0]data_in;
    reg [1:0]sel_in;
    wire y_out;

    mux4_1 DUT(data_in,sel_in,y_out);

    task initialize;
        begin
            {data_in,sel_in} = 0;
        end
    endtask

    task stimulus(input [3:0]i,input [1:0]j);
        begin
            #10;
            d = i;
            sel = j;
        end
    endtask

    initial
        begin
            initialize;
            stimulus(4'd5,2'd2);
            stimulus(4'd15,2'd3);
            stimulus(4'd6,2'd1);
        end
   
    initial
        begin
            #100 $finish;
        end 
endmodule