module cputoDataAdapter(input [31:0] dataRom,dataRam,input select,output [31:0] out);

	mux2_1 #(.N(32)) mymux (.A(dataRom),.B(dataRam),.sel(select),.C(out));


endmodule 