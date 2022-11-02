`timescale 1 ps / 1 ps
module testMemoryRetrieve(); 

	logic clk,rst,parallelFlag,readyFlag;
	logic [7:0] parallelAddress,address;
	logic [31:0] instruction;
	

	instructionManager myManager(.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.readyFlag(readyFlag),.instructionOutput(instruction));
		
	
	always begin
		#10;
		clk=!clk;
	
	end
		
	
	initial begin
		clk=0;
		rst=1;
		parallelFlag=0;
		parallelAddress=0;
		
		#10;
		rst=0;
		
		
		#100
		
		$finish();
		
	
	end


endmodule 