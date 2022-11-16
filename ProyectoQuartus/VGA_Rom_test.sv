module VGA_Rom_test();
	logic [31:0] imageAddress, imageOut;
	logic clk, rst,Hsync,Vsync, VgaClk;
	logic [7:0] r,b,g;	
	imageRom myImageRom(.address(imageAddress),.Q(imageOut));
	VGA_Controller myVGA(clk,rst,imageOut[7:0],imageAddress,Hsync,Vsync,r,g,b,VGA_clk);
	initial begin
		clk=0;
		rst=1;
		#10;
		rst=0;
		#1000;
	end
	always begin 
		#10;
		clk=!clk;
	end
endmodule 