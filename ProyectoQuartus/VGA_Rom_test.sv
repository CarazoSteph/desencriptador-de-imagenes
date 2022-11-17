`timescale 1 ps / 1 ps 
module VGA_Rom_test();
	logic [31:0] imageOut;
	logic [15:0] imageAddress;
	logic clk, rst,Hsync,Vsync, VgaClk;
	logic [7:0] r,b,g;	
	logic [8:0]switch;
	/*
	VGA_Controller myVGA(clk,rst,imageOut[7:0],imageAddress,Hsync,Vsync,r,g,b,VgaClk);
	cpu mycpuModule(.clk(clk),.rst(rst),.switch(switch),.GPUAddress(imageAddress),.GPUData(imageOut));
	*/
	topModel mydecripto(clk,switch,Hsync,Vsync,r,g,b,VgaClk);
	initial begin
		clk=0;
		switch= 9'b111010101;
		#10;
		switch= 9'b110010101;
		rst=0;
		#1000;
	end
	always begin 
		#10;
		clk=!clk;
	end
endmodule 