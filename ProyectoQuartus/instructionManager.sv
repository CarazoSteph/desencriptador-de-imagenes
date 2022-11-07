module instructionManager(input clk,input rst,input parallelFlag, input [7:0] parallelAddress,output readyFlag, output logic [31:0] instructionOutput);


	logic [7:0] instruction1,instruction2,instruction3,instruction4,currentInstruction;
	logic [31:0] instruction;
	logic [1:0] count;
	instructionGetter myInstructionGetter(.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.instruction(currentInstruction));
	genericCounter #(.N(2),.Stop(3)) instCount (.clk(clk),.rst(rst),.parallel(1'b0),.parallelFlag(1'b0),.count(count),.flag(readyFlag));

	always_ff @(posedge clk or posedge rst) begin
		if(rst)instructionOutput=0;
		else begin
			instructionOutput[31:24]=instruction1;
			instructionOutput[23:16]=instruction2;
			instructionOutput[15:8]=instruction3;
			instructionOutput[7:0]=instruction4;
		
		end
	end
	
	always_ff @(count) begin
		case(count)
			0: instruction1=currentInstruction;
			1: instruction2=currentInstruction;
			2: instruction3=currentInstruction;
			3: instruction4=currentInstruction;
		endcase
	
	end
	
endmodule 


