module genericCounter #(parameter N=8,parameter M=3)(input clk,rst, input [N-1:0] parallel,input parallelFlag,input [M-1:0] step, output [N-1:0] count);
		
		logic [N-1:0] current,next;
		always_ff @(posedge clk or posedge rst) begin
			if(rst) current=0;
			else current=next;
		end
		
		always_comb begin
			if(parallelFlag)next=parallel;
			else begin
				next=current+step;
			
			end
		
		end
		assign count=current;

endmodule 