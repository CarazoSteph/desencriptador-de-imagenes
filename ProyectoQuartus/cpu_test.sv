
`timescale 1ps/1ps
module cpu_test();
	logic clk,rst;
	logic [8:0] switch;
	logic [31:0] GPUAddress;
	logic [7:0] GPUData;
	logic [7:0] data [16383:0]; 
	cpu mycpuModule(.clk(clk),.rst(rst),.switch(switch),.GPUAddress(GPUAddress),.GPUData(GPUData));
	
	always begin
		#10;
		clk=!clk;
	end 
	
	initial begin 
		clk=1;
		GPUAddress=0;
		switch=9'b000010101;
		rst=1;
		#10;
		rst=0;
		
		
		#1000000;
		clk=0;
		 for(int i=0;i<16384;i++) begin
				GPUAddress=i;
				#10;
				data[i]=GPUData;
				#10;
				
		 end
		 $writememh("memory_ram.txt", data);
		
		
	
	end
	
	
endmodule 