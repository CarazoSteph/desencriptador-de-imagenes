module ramModule(input rst,clk,en,input [31:0] address,addressGPU,input [31:0] data,output [31:0] Out,OutGPU);

	logic [16383:0] [31:0] memory;
	
	always_ff @(posedge rst or negedge clk) begin
		if(rst)memory[16383:0]=32'b0;
		else begin
			if(en)memory[address]=data;
		end
	end
	assign Out=memory[address];
	assign OutGPU=memory[addressGPU];
	

endmodule 