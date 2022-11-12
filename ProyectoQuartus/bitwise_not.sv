module bitwise_not #(parameter N=8)(input [N-1:0] a,output [N-1:0] c );
	assign c=~a;
	
endmodule 