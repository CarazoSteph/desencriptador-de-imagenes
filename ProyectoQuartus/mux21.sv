module mux2_1 #(parameter N=4)(input [N-1:0] A,B,input sel,output logic [N-1:0] C);
	always_comb begin
		if(!sel)C=A;
		else C=B;
	end

endmodule 