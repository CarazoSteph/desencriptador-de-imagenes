module genericCounter #(parameter N=8, parameter [N-1:0] Stop=255)(input clk,rst, input [N-1:0] parallel,input parallelFlag, output [N-1:0] count,output flag);
		
		logic [N-1:0] current,next;
		always_ff @(posedge clk or posedge rst) begin
			if(rst) current=0;
			else current=next;
		end
		
		always_comb begin
			if(parallelFlag)next=parallel;
			else begin
				if(current==Stop) next=0;
				else next=current+1;
			
			end
		
		end
		assign flag= (current==Stop);
		assign count=current;

endmodule 