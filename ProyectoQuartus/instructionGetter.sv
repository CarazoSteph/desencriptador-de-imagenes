module instructionGetter(input clk,rst,parallelFlag,input [7:0] parallelAddress,output [31:0] instruction);

	logic [7:0] address;
	
	instructionMemoryProgramCounter PC(.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.address(address));
	//instructionMemory  memory(.address(address),.clock(clk),.q(instruction));
	InstructionRom memory(.address(address),.Q(instruction));
		
endmodule 