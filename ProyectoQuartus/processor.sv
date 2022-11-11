module processor(input rst,clk,input [31:0] readData,instruction,output WR,output [7:0] address,output [31:0] writeData,output MemtoRegOut );

	logic [1:0] op;
	logic [5:0] funct;
	logic [3:0] cond;
	logic [3:0] Rn,Rm,Rd; 
	logic [23:0] imm,immFp;
	logic  PCSrc,MemtoReg,MemWrite,ALUSrc,ImmSrc,RegWrite;
	logic [3:0]  ALUControl;
	logic [1:0] RegSrc;
	logic [7:0] pc,pc4,pc8,pcIn;
	logic [3:0] RA1,RA2;
	logic [31:0] RD1,RD2,SrcA,SrcB;
	logic [3:0] Flags,flagsRetained;
	instructionDecoder myDecoder(.instruction(instruction),.op(op),.funct(funct),.cond(cond),.Rn(Rn),.Rm(Rm),.Rd(Rd),.imm(imm));
	controlUnit myControlUnit(.op(op),.funct(funct), .cond(cond),.Rd(Rd), .Flags(flagsRetained),
	.PCSrc(PCSrc),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUControl(ALUControl),.RegSrc(RegSrc));
	
	FlagHolder myFlagHolder(.rst(rst),.op(op),.FlagsInput(Flags),.FlagsOut(flagsRetained));
	
	registerBank myRegisterBank(.clk(clk),.rst(rst), .A1(RA1),.A2(RA2),.A3(Rd),.WE3(RegWrite),.WD3(readData),.R15(pc8),.RD1(RD1),.RD2(RD2));
	ALU #(.N(32)) myALU(.A(SrcA),.B(SrcB), .sel(ALUControl), .out(address),.Neg(Flags[3]),.Z(Flags[2]),.Ca(Flags[1]),.O(Flags[0]));
	
	
	mux2_1 #(4) A1Selector(.A(Rn),.B(4'b1111),.sel(RegSrc[0]), .C(RA1));
	
	mux2_1 #(4) A2Selector(.A(Rm),.B(Rd),.sel(RegSrc[1]),.C(RA2));
	
	mux2_1 #(8) PCselector (.A(pc4),.B(readData),.C(pcIn), .sel(PCSrc));
	
	flipFlopD #(.N(8)) myClockFlop(.clk(!clk),.rst(rst),.In(pcIn),.Out(pc));
	
	//flipFlopD #(.N(24)) myImmFP(.clk(clk),.rst(rst),.In(imm),.Out(immFp));
	
	mux2_1 #(8) myALUSelect (.A(RD2),.B(imm),.sel(ALUSrc),.C(SrcB));
	
	
	assign pc4=pc+4;
	assign pc8=pc4+4;
	assign SrcA=RD1;
	assign writeData=RD2;
	assign WR=MemWrite;
	assign MemtoRegOut=MemtoReg;
endmodule 