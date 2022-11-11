module FlagHolder(input rst,input [1:0] op,input [3:0] FlagsInput,output [3:0] FlagsOut);
	logic [3:0] state,nextState;
	
	
	always_ff @(*) begin
		if(rst)state=0;
		else begin
			if(op==0 | op==1)state=nextState; //caso de branch o no definido 
		end
	
	end
	
	assign nextState=FlagsInput;
	
	assign FlagsOut=state;

endmodule 