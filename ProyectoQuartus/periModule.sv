module periModule(input rst,clk,input [8:0] switch, input en,input address, output [31:0] out);
	logic [1:0] [7:0] switchState;
	
	always_ff @(posedge rst or negedge clk)begin
		if(rst)switchState[1:0]=0;
		else begin
			switchState[1]={7'b0,switch[8]};
			switchState[0]=switch[7:0];
		end
	end
	assign out={24'b0,switchState[address]};
endmodule 