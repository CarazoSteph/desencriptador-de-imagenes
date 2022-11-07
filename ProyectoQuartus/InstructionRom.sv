module InstructionRom(input [7:0] address,output [31:0] Q);
	logic [7:0] memory [255:0];
	initial $readmemh("Processor.mem",memory);
	
	

	
	assign Q={memory[address],memory[address+1],memory[address+2],memory[address+3]};

endmodule 