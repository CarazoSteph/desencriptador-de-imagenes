`timescale 1 ps / 1 ps
module romTest();
	logic	[7:0]  address;
	logic	  clk;
	logic	[7:0]  q;
	instructionMemory mymemory (
	address,
	clk,
	q);
	
	always begin
		#5;
		clk=!clk;
		
	end
	always begin
		#10;
		address=address+1;
	end
	initial begin
		clk=1'b0;
		address=8'b0;
		#100;
		$finish();
	end

endmodule 