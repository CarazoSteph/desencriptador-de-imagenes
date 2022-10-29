module instructionDecoder(input [31:0] instruction);

	logic [1:0] opType; //tipo de operacion: memeoria, datos o branch
	logic [3:0]flags; //banderas del condicional
	
	
	//Para el caso de Data processing
	logic ImmCondition; //Codicion para immediate
	logic [3:0] OpCode; //operacion a solicitar
	logic S;  //condition codes: verifica si tiene en cuenta las banderas para ejecutar
	logic [3:0] Rn; //Primer registro operando
	logic [3:0] Rd; //Registro Destino
	logic [11:0] operand2; //segundo operando, podria tener dos casos un registro o un inmediato
	logic [3:0] Rm; //segundo operando en caso de utilizarse
	logic [1:0] shiftType; //tipo shift en caso de existir
	logic [4:0] shiftAmount; //numero de shift guardado en un inmediato
	logic [3:0] shiftRegister; //numero de registro en donde se almacena el shift
	logic shiftMode;//determina si el shift que se lleva a cabo es con un inmediato o con el contenido de un registro
	logic [3:0] rotate; //rotacion para el caso de segundo operando inmediato
	logic [7:0] imm; //valor del inmediato
	
	//Para el caso de branch 
	
	logic L; //link bit
	logic [23:0] offset;
	
	assign opType=instruction[27:26];
	assign flags=instruction[31:28];
	
	

endmodule 