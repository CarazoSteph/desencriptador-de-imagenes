module complement_2_to_sign_magnitud #(parameter N=6)(input [N-1:0] A, output logic [N-1:0] B);
	logic [N-2:0] out;
	logic sign;
	assign sign=A[N-1];
	assign out= (~A[N-2:0])+1'b1;
	always_comb begin
		if(sign)B={sign,out};
		else B=A;
	end
	

endmodule 