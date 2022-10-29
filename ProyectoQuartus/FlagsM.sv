module FlagsM #(parameter N=5) (input [3:0] sel, input[N-1:0] A,B, input[N:0] a,b,d,e,f,g,h,i,j, output logic  Neg,Z,O,Ca, input [2*N-1:0] c);
	logic [N-1:0] out;
	always_comb begin
		case(sel)
			
			4'b0000: begin
				out=a;
				Ca=a[N];
				O= (A[N-1] & B[N-1] & !a[N-1])   |  (!A[N-1] & !B[N-1] & a[N-1])  ;
				Neg=out[N-1];
			end
			4'b0001: begin
				out=b;
				Ca=b[N];
				O = (A[N-1] & !B[N-1] & !b[N-1])   |  (!A[N-1] & B[N-1] & b[N-1]);
				Neg=out[N-1];
			end
			
			4'b0010: begin
				out=c;
				Ca=c[2*N-1];
				O = |(c[2*N-1:N]);
				Neg=out[N-1];
			
			end
			4'b0011: begin
				out=d;
				Ca=1'b0;
				O = ~|(B);
				Neg=out[N-1];
			
			end
			4'b0100: begin
				out=e;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
			
			4'b0101: begin
				out=f;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
			4'b0110: begin //shift
				out=g;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
			4'b0111: begin //and
				out=h;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
			4'b1000: begin //or
				out=i;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
			4'b1001: begin  //xor
				out=j;
				Ca=1'b0;
				O = 1'b0;
				
				Neg=1'b0;
			
			end
			default: begin
				out=j;
				Ca=1'b0;
				O = 1'b0;
				Neg=1'b0;
			
			end
		
		
		endcase
		Z=~|(out);
		
	
	end
endmodule
