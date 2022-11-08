`timescale 1 ps / 1 ps
module memoryGetterTest();
	logic clk,rst,parallelFlag;
	logic [7:0] parallelAddress;
	logic [31:0] instruction;
	
	instructionGetter memoryGetter (.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.instruction(instruction));
	
	
	always begin
		clk=!clk;
		#10;
	
	end
	
	initial begin
		clk=1;
		rst=1;
		parallelFlag=0;
		parallelAddress=0;
		
		#10;
		rst=0;
		#200;
		
		$finish();
	
	end

endmodule 