module imageRom (input [31:0] address,output [31:0] Q);
	logic [7:0] memory [16383:0];
	initial $readmemh("image.mem",memory); //aqui hay que cambiar el archivo para el de la imagen que mando el profe de imagen
	
	

	
	assign Q={24'b0,memory[address]};

endmodule 