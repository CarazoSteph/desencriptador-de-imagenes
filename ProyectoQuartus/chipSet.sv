module chipSet(input WR,input [31:0] address,output logic [1:0] s,output logic en1,en2,en3);
	
	always_comb begin
		if(address>=0 & address<16384)begin
			s=0;
			en2=0;
			en3=0;
			if(WR) en1=1;
			else en1=0;
		end
		else if(address>=16384 & address<32768)begin
			s=1;
			en1=0;
			en3=0;
			if(WR)en2=1;
			else en2=0;
		end
		
		else begin
			s=2;
			en1=0;
			en2=0;
			if(WR)en3=1;
			else en3=0;
		end
		
	end
endmodule 