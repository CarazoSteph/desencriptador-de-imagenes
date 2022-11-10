module flipFlopD #(parameter N=4)(input clk,rst,input [N-1:0] In,output[N-1:0] Out);
	logic state,nextState;
	always_ff @(posedge clk or posedge rst)begin
		if(rst)state=0;
		else state=nextState;
	end
	always_comb begin
		nextState=In;
	end
	assign Out=state;
	
	

endmodule 