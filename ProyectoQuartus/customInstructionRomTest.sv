module customInstructionRomTest();
	logic [7:0] address;
	logic [31:0] Q;
	
	InstructionRom myRom(.address(address),.Q(Q));
	
	initial begin
		address=0;
	end
	always begin
		#10;
		address=address+4;
	end


endmodule
