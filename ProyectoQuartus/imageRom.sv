module imageRom (input [15:0] address,addressGPU,output [31:0] Q,outputGPU);
	logic [7:0] memory [16383:0];
	initial $readmemh("image.mem",memory); //aqui hay que cambiar el archivo para el de la imagen que mando el profe de imagen
	
	

	
	assign Q={24'b0,memory[address]};
	assign outputGPU={24'b0,memory[addressGPU]};

endmodule 