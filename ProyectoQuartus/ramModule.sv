module ramModule(input rst,clk,en,input [15:0] address,addressGPU,input [31:0] data,output [31:0] Out,OutGPU);

	logic [16383:0] [7:0] memory;
	
	always_ff @(posedge rst or negedge clk) begin
		if(rst)memory[16383:0]=8'b0;
		else begin
			if(en)memory[address]=data;
		end
	end
	assign Out={24'b0,memory[address]};
	assign OutGPU={24'b0,memory[addressGPU]};
	

endmodule 