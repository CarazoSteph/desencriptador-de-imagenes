module armToALUAdapter(input [3:0] In,output logic [3:0] Out);
	
	always_comb begin
	
		case(In)
		
			0: Out=4'b0111; //And
			1: Out=4'b1001; //XOR
			2: Out=4'b0001;	//Sub
			3: Out=4'b0001; //reverse substract not implemented
			4: Out=4'b0000; //Add
			5: Out=4'b0000;
			6: Out=4'b0001;
			7: Out=4'b0001;
			10: Out=4'b0001;
			13:Out=4'b0000;
			default: Out=4'b0000;
		
		
		endcase
	
	end


endmodule 