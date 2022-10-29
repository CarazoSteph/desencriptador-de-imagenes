module sign_magnitud_to_complement #(parameter N=6)(input [N-1:0] A,output logic [N-1:0] B);
	
	logic [N-1:0] comp;
	logic [N-1:0] magnitud;
	logic sign;
	
	assign sign=A[N-1];
	assign magnitud={1'b0,A[N-2:0]};
	
	assign comp= (~magnitud)+1'b1;

	always_comb begin
		if(sign) B= comp;
		else  B=A;
	end 
	
	
endmodule 