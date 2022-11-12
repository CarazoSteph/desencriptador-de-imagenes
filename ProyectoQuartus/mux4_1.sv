module mux4_1 #(parameter N=32)(input [N-1:0] A,B,C,D,input [1:0] sel,output logic [N-1:0] Out);
	
	always_comb begin
		case(sel)
			0: Out=A;
			1: Out=B;
			2: Out=C;
			3: Out=D;
			default Out=A;
		endcase
	end
	
endmodule 