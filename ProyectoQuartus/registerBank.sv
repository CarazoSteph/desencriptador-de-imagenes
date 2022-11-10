module registerBank(input clk,rst, input [3:0] A1, A2, A3, input WE3,input [31:0] WD3,input [31:0] R15,output logic [31:0] RD1,RD2);
	logic [15:0] [31:0] register;
	/*
	always_ff @(posedge clk or posedge rst)begin
		if(rst) begin
			RD1=0;
			RD2=0;
		end
		else begin
			RD1=register[A1];
			RD2=register[A2];
		end
	end
	*/
	assign RD1=register[A1];
	assign RD2=register[A2];

	always_ff @(negedge clk or posedge rst) begin
	  if(rst) begin
		register[15:0]=0;
	  end
	  else begin
		if(WE3) register[A3]=WD3;
		register[14]=R15;
	  end
	end


endmodule 