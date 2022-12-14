module Operations #(parameter N=6)(input [N-1:0] A,B, output [N:0] andOut, orOut, xorOut, shiftLOut, shiftROut, modOut, divOut, subOut, sumOut, output [N-1:0] sumOutComp, subOutComp,divOutComp, modOutComp , output[2*N-1:0] multOut, multOutComp);
	logic [N:0] a,b,d,e,f,g,h,i,j;
	logic [2*N-1:0] c;
	logic [N-1:0] A_c,B_c;
	logic [N-1:0] add_comb,subs_comb,mult_comb,div_comb,mod_comb;
	
	 
	sign_magnitud_to_complement #(.N(N)) to_comp_1 (.A(A),.B(A_c));
	sign_magnitud_to_complement #(.N(N)) to_comp_2 (.A(B),.B(B_c));
	
	

	
	adder #(.N(N)) myadder(.a(A_c),.b(B_c),.c(a));
	subtracter #(.N(N)) mysubstracter(.a(A_c),.b(B_c),.c(b));
	multiplier #(.N(N)) mymultiplier(.a(A_c),.b(B_c),.c(c));
	division #(.N(N)) mydiv (.A(A_c),.B(B_c),.C(d));
	mod #(.N(N)) mymod (.A(A_c),.B(B_c),.C(e));
	shifL #(.N(N)) myshiftL (.a(A),.b(B),.c(f));
	shifR #(.N(N)) myshiftR (.a(A),.b(B),.c(g));
	bitwise_and #(.N(N)) myand(.a(A),.b(B),.c(h));
	bitwise_or #(.N(N)) myor(.a(A),.b(B),.c(i));
	bitwise_xor #(.N(N)) myxor(.a(A),.b(B),.c(j));
	
	complement_2_to_sign_magnitud #(.N(N)) to_mag_1 (.A(a[N-1:0]),.B(add_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_2(.A(b[N-1:0]),.B(subs_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_3 (.A(c[N-1:0]),.B(mult_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_4(.A(d[N-1:0]),.B(div_comb));
	complement_2_to_sign_magnitud #(.N(N)) to_mag_5(.A(e[N-1:0]),.B(mod_comb));
	
	assign sumOut= a;
	assign subOut = b;
	assign multOut = c; 
	assign divOut = d;
	assign modOut = e;
	assign shiftLOut = f; 
	assign shiftROut = g;
	assign andOut = h;
	assign orOut = i; 
	assign xorOut = j; 
	
	assign sumOutComp = add_comb; 
	assign subOutComp = subs_comb;
	assign divOutComp = div_comb;
	assign modOutComp = mod_comb;
	assign multOutComp = mult_comb;
	
endmodule