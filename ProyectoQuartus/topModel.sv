module topModel(
	input  clk,
	input [7:0] switch,
	output logic Hsync,
	output logic Vsync,
	output logic[7:0] Red,
	output logic[7:0] Green,
	output logic[7:0] Blue,
	output logic VGA_clk
	);
	logic [15:0] imageAddress; 
	logic [31:0] imageOut, dataRom, dataRam;
	logic clk_25M;
	
	clock_divider myClk(clk,clk_25M);
	
	cputoDataAdapter myCPuAdapter(dataRom,dataRam,switch[6],imageOut);
	
	cpu myCPU(clk_25M,switch[5],{switch[7], 3'b0,switch[4:0]},imageAddress,dataRam,dataRom);
	
	//VGA_Controller myVGA(clk_25M,switch[5],imageOut[7:0],imageAddress,Hsync,Vsync,Red,Green,Blue,VGA_clk);

endmodule 