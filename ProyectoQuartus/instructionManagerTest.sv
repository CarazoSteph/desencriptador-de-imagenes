`timescale 1 ps / 1 ps
module instructionManagerTest();
	logic clk,rst,parallelFlag,readyFlag;
	logic [7:0] parallelAddress;
	logic [31:0] instructionOutput;
	instructionManager myManager(.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.readyFlag(readyFlag),.instructionOutput(instructionOutput));
	
	
	
	initial begin
		clk=0;
		rst=1;
		#10;
		rst=0;
		#1000;
		$finish();
	end
	always begin 
		#10;
		clk=!clk;
	end
endmodule 