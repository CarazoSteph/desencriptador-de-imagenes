module cputoDataAdapter(input [7:0] dataRom,dataRam,input select,output [7:0] out);

	mux2_1 #(.N(8)) mymux (.A(dataRom),.B(dataRam),.sel(select),.C(out));


endmodule 