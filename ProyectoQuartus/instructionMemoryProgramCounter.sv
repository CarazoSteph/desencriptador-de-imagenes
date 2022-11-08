module instructionMemoryProgramCounter(
	input clk,
	input rst,
	input parallelFlag,
	input [7:0] parallelAddress,
	output [7:0] address

);


	genericCounter #(.N(8),.M(3)) pcCounter(.clk(clk),.rst(rst), .parallel(parallelAddress),.parallelFlag(parallelFlag),.step(3'b100),.count(address));


endmodule 