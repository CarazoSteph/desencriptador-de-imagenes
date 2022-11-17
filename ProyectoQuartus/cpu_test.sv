
`timescale 1ps/1ps
module cpu_test();
	logic clk,rst;
	logic [8:0] switch;
	logic [31:0] GPUAddress,GPUData;
	cpu mycpuModule(.clk(clk),.rst(rst),.switch(switch),.GPUAddress(GPUAddress),.GPUData(GPUData));
	
	always begin
		#10;
		clk=!clk;
	end 
	
	initial begin 
		clk=1;
		GPUAddress=0;
		switch=9'b101010101;
		rst=1;
		#10;
		rst=0;
		
		
		#10000;
		
		$finish();
	
	end
	
	
endmodule 