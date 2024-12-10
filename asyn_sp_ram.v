//Single port RAM
/*The Single Port RAM, which is 8 bit wide and has 16 memory locations. 
The data can be written on a memory location by providing its address and making "write" high and "enable" low. 
The data can be read from a memory location by providing the address and making "enable" high and "write" low. 
This RAM has single port for data writing and reading.*/

//RTL
module ram(input write_in,enable_in,input [3:0]addr_in,inout [7:0]data);

	reg [7:0]mem[15:0]; 

   	always@(data,write_in,enable_in,addr_in)
      	if(write_in && !enable_in)
	 		mem[addr_in]=data;

   	assign data= (enable_in && !write_in) ? mem[addr_in] : 8'hzz;
endmodule

//TB
module ram_tb;
	wire [7:0] data;
   	reg  [3:0] addr;
   	reg  write_in,enable_in;

   	reg  [7:0] tempd;
   	integer l;

	ram DUT(write_in,enable_in,addr,data);
   	assign data=(write_in && !enable_in) ? tempd : 8'hzz;

   	task initialize();
      	begin
	 		write_in=1'b0; enable_in=1'b0; tempd=8'h00;
      	end
   	endtask

	task stimulus(input [3:0]i,input [7:0]j);
		begin
			addr = i;
	 		tempd = j;
      	end
   	endtask

   	task write();
      	begin
	 		write_in=1'b1;
	 		enable_in=1'b0;
      	end
   	endtask

   	task read();
      	begin
	 		write_in=1'b0;
	 		enable_in=1'b1;
      	end
   	endtask

   	task delay;
      	begin
	 		#10;
      	end
   	endtask

   	initial
      	begin
	 	initialize;
	 	delay;
	 	write;
	 	for(l=0;l<16;l=l+1)
	    	begin
	       		stimulus(l,l);
	       		delay;
	    	end
	 		initialize;
	 		delay;
			read;
	 	for(l=0;l<16;l=l+1)
    		begin
	       		stimulus(l,l);
	       		delay;
	    	end
			delay;
 			$finish;
      	end
endmodule