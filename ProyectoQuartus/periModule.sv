module periModule(input rst,clk,input [8:0] switch, input en,input [3:0] address, output [31:0] out);
	logic [8:0] switchState;
	
	always_ff @(posedge rst or negedge clk)begin
		if(rst)switchState=0;
		else begin
			switchState=switch;
		end
	end
	assign out={31'b0,switch[address]};
endmodule 