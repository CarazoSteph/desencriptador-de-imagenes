module cpu(input clk,rst,input [8:0] switch,input [15:0] GPUAddress,output [7:0] GPUData,GPUDataRom);
	logic [31:0] instruction;
	logic [7:0] pc;
	logic [31:0] ramOut,imageOut,periOut;
	logic [31:0] address;
	logic [1:0] selectMemory;
	logic WR,MemtoReg;
	logic en1,en2,en3;
	logic [31:0] memoryOut;
	logic [31:0] readData,writeData;
	
	logic [31:0] romAddress,imageAddress,periAddress;
	
	InstructionRom myinstructionrom(.address(pc),.Q(instruction));
	
	processor myprocessor(.rst(rst),.clk(clk),.readData(readData),.instruction(instruction),.WR(WR),.address(address),.writeData(writeData),.MemtoRegOut(MemtoReg), .pc(pc) );
	
	
	
	//ramModule myRamModule(.rst(rst),.clk(clk),.en(en1),.address(romAddress[15:0]),.data(writeData),.Out(ramOut),.addressGPU(GPUAddress),.OutGPU(GPUData)); 
	
	
	ipRam myramModule(.address_a(romAddress),.address_b(GPUAddress),.byteena_a(en1),.data_a(writeData),.data_b(GPUData),.inclock(!clk),.outclock(clk),.wren_a(en1),.wren_b(1'b0),.q_a(ramOut),.q_b(GPUData));

	
	
	imageRom myImageRom(.address(imageAddress[15:0]),.Q(imageOut),.addressGPU(GPUAddress),.outputGPU(GPUDataRom));
	
	periModule myperiModule(.rst(rst),.clk(clk),.switch(switch),.en(en1),.address(periAddress[0]),.out(periOut));
	
	
	
	chipSet mychipset(.WR(WR),.address(address),.s(selectMemory),.en1(en1),.en2(en2),.en3(en3));
	
	
	mux4_1 #(.N(32)) myMemorySelector(.A(ramOut),.B(imageOut),.C(periOut),.D(0),.sel(selectMemory),.Out(memoryOut));
	
	
	mux2_1 #(.N(32)) MemRegSelector(.A(address),.B(memoryOut),.sel(MemtoReg),.C(readData));
	
	assign romAddress=address;
	assign imageAddress=address-16384;
	assign periAddress=address-32768;
	assign ramOut[31:8]=24'b0;
	
	
endmodule 