module bitwise_xor #(parameter N=6)(input [N-1:0] a,b, output[N-1:0] c);
	assign c=a^b;
endmodule 