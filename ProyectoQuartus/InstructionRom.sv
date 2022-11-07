module InstructionRom(input [7:0] address,output [7:0] Q);
	logic [7:0] memory [255:0];
	initial $readmemh("Processor.mem",memory);
	
	

	
	assign Q=memory[address];

endmodule 