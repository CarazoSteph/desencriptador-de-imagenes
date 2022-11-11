module periModule(input rst,clk,switch,en, output [31:0] data);
	logic switchState;
	
	always_ff @(posedge rst or negedge clk)begin
		if(rst)switchState=0;
		else begin
			switchState=switch;
		end
	end
	assign data={31'b0,switch};
endmodule 