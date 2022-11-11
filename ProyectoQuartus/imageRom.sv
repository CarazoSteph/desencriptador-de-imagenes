module imageRom (input [7:0] address,output [31:0] Q);
	logic [31:0] memory [255:0];
	initial $readmemh("Processor.mem",memory); //aqui hay que cambiar el archivo para el de la imagen que mando el profe de imagen
	
	

	
	assign Q=memory[address];

endmodule 