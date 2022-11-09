module processor(input rst,clk,input [31:0] readData,output WR,output [7:0] address,output [31:0] writeData );

	logic [1:0] op;
	logic [5:0] funct;
	logic [3:0] cond;
	logic [3:0] Rn,Rm,Rd; 
	logic [23:0] imm;
	logic  PCSrc;MemtoReg,MemWrite,ALUSrc,ImmSrc,RegWrite;
	logic [3:0]  ALUControl;
	logic [1:0] RegSrc;
	logic [7:0] pc,pc4,pc8;
	instructionDecoder myDecoder(.instruction(instruction),.op(op),.funct(funct),.cond(cond),.Rn(Rn),.Rm(Rm),.Rd(Rd),.imm(imm));
	controlUnit(.op(op),.funct(funct), .cond(cond),.Rd(Rd), input [3:0] Flags,
	.PCSrc(PCSrc),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUControl(ALUControl),.RegSrc(RegSrc));
	
	registerBank(.clk(clk),.rst(rst), input [3:0] A1, A2, A3, input WE3,input [31:0] WD3,input [31:0] R15,output logic [31:0] RD1,RD2)
	ALU #(parameter N=6)(input [N-1:0] A,B, input [3:0] sel, output logic [N-1:0] out, output logic  Z,O,Ca,Neg )
	
	module instructionMemoryProgramCounter(
	input clk,
	input rst,
	input parallelFlag,
	input [7:0] parallelAddress,
	output [7:0] address

	);
	
	mux21 A1Selector(input [N-1:0] A,B,input sel,output logic [N-1:0] C);
	mux21 A2Selector(input [N-1:0] A,B,input sel,output logic [N-1:0] C);

endmodule 