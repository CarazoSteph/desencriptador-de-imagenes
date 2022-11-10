module controlUnit(input [1:0] op,input [5:0] funct, input [3:0] cond,input [3:0] Rd, input [3:0] Flags,
	output logic  PCSrc,MemtoReg,MemWrite,ALUSrc,ImmSrc,RegWrite,output logic [3:0]  ALUControl,output logic [1:0] RegSrc 
);

	logic [3:0] adapterOutput;
	
	armToALUAdapter myAdapter(.In(funct[4:1]), .Out(adapterOutput));
	always_comb begin
		PCSrc=(op==2) &(cond[3]==Flags[3]);
	end
	
	always_comb begin
	
		MemtoReg= ((funct[0]& !funct[2])|(funct[0]&funct[2])) & (op==1); 
	end
	
	always_comb begin 
		MemWrite= ((!funct[0]& !funct[2])|(!funct[0]&funct[2])) &(op==1); 
	end
	always_comb begin
		case(op)
			0: ALUControl=adapterOutput;
			1: ALUControl=0; //esta esta mal probablemente, falta definir correctamente con lo de preindex y postindex
			2: ALUControl=1; //aqui hay que poner el de la resta;
			default ALUControl=0;
		
		endcase
	end
	
	always_comb begin
		ALUSrc= ((op==0) & (funct[5])) |((op==1)&(!funct[5])) | (op==2); 
	end	
	
	always_comb begin
		ImmSrc= ((op==0) & (funct[5])) |((op==1)&(!funct[5])) | (op==2);  
	end
	always_comb begin
		RegWrite=(op==0 & op!=4'b1010)|(op==1 & funct[0]);
	
	end
	
	always_comb begin
		if(op==2)RegSrc[0]=1;
		else RegSrc[0]=0;
		if((op==1) &(!funct[0]))RegSrc[1]=1;
		else RegSrc[1]=0;
		
	end


endmodule 