module ALU #(parameter N=6)(input [N-1:0] A,B, input [3:0] sel, output logic [N-1:0] out, output logic  Z,O,Ca,Neg );
	logic [N-1:0] add_comb,subs_comb,mult_comb,div_comb,mod_comb;
	logic [N:0] a,b,d,e,f,g,h,i,j;
	logic [2*N-1:0] c;
	/* 
		0000:suma
		0001:resta
		0010:multiplicacion
		0011:division
		0100: modulo
		0101: shift Left
		0110: shift Right
		0111: and
		1000: or
		1001: xor
	*/
	Operations #(.N(N)) myOperations (.A(A),.B(B), .andOut(h), .orOut(i), .xorOut(j), .shiftLOut(f), .shiftROut(g), .modOut(e), .divOut(d), .subOut(b), .sumOut(a), .sumOutComp(add_comb), .subOutComp(subs_comb), .divOutComp(div_comb), .modOutComp(mod_comb), .multOut(c), .multOutComp(mult_comb));
	mux_9_1 #(.N(N)) myMux (.select(sel), .a(add_comb),.b(subs_comb),.c(mult_comb),.d(div_comb),.e(mod_comb),.f(f),.g(g),.h(h),.i(i),.j(j),.out(out));
	FlagsM #(.N(N)) myFlags (.sel(sel), .A(A),.B(B), .a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.i(i),.j(j),.Neg(Neg),.Z(Z),.O(O),.Ca(Ca));

endmodule 