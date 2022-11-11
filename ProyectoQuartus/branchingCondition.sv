module branchingCondition(input [3:0] Cond,Flags,output logic bCon);
	
	always_comb begin
		case(Cond)
			0: bCon=Flags[2]; //equals
			1: bCon=!Flags[2]; //not equals
			10:bCon=(Flags[3]==Flags[0]); //greater or equals
			11:bCon=(Flags[3]!=Flags[0]); //less than
			12:bCon= !Flags[2] & (Flags[3]==Flags[0]); //greather than
			13:bCon= Flags[2] | (Flags[3]!=Flags[0]); //less than or equal
			14:bCon=1;
			default: bCon=0;
		
		endcase
	
	end


endmodule 