module instructionManager(input clk,input rst,input parallelFlag, input [7:0] parallelAddress,output readyFlag, output logic [31:0] instructionOutput);


	logic [7:0] currentInstruction;
	logic [31:0] instruction;
	logic [1:0] count;
	instructionGetter myInstructionGetter(.clk(clk),.rst(rst),.parallelFlag(parallelFlag),.parallelAddress(parallelAddress),.instruction(currentInstruction));
	genericCounter #(.N(2),.Stop(3)) instCount (.clk(clk),.rst(rst),.parallel(1'b0),.parallelFlag(1'b0),.count(count),.flag(readyFlag));
	
	always_ff @(posedge rst)begin
		instruction=0;
	end
	always_ff @(posedge clk) begin
		
		case(count)
			0: 
			begin
				instruction[31:24]=currentInstruction;
				instruction[23:16]=instruction[23:16];
				instruction[15:8]=instruction[15:8];
				instruction[7:0]=instruction[7:0];
		
			end 
			1: 
			begin
				instruction[31:24]=instruction[31:24];
				instruction[23:16]=currentInstruction;
				instruction[15:8]=instruction[15:8];
				instruction[7:0]=instruction[7:0];
			end
			2: 
			begin
				instruction[31:24]=instruction[31:24];
				instruction[23:16]=instruction[23:16];
				instruction[15:8]=currentInstruction;
				instruction[7:0]=instruction[7:0];
			
			end
			3: 
			begin
				instruction[31:24]=instruction[31:24];
				instruction[23:16]=instruction[23:16];
				instruction[15:8]=instruction[15:8];
				instruction[7:0]=currentInstruction;
			
			end
		
		endcase 
	
	
	end
	assign instructionOutput=instruction;

	
endmodule 


