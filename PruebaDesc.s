			mov 	R1,#128
			adc 	R1, R1, R1//R1 almacena la posicion inicial de memoria, ADC ES LA MULTIPLICACION EN NUESTRA ARQUITECTURA
			mov 	R10, #0// R10 tendra el address inicial a memoria Ram
			//Conseguir los datos del Selector de operacion de descriptacion 
			adc		R2,R1,#2//ADC ES LA MULTIPLICACION EN NUESTRA ARQUITECTURA
			ldr		R8, [R2]//dato con el que realizar xor
			add 	R2,R2,#1
			ldr		R7,[R2] // direccion del switch
			mov		R2,#100 //num filas
			mov		R3,#100  //num columnas
			mov		R4,#0 // contador de filas
			mov		R5,#0 //contador de columnas
			mov		R6,#0 //actual pixel
			mov		R9,R1 //posicion actual de memoria a leer
			b		rowIterator
rowIterator:
			cmp		R2,R4
			beq		endEncr
			add		R4,R4,#1
			mov		R5,#0
			b		columnIterator
columnIterator:
			cmp		R3,R5
			beq		rowIterator
			add		R5,R5,#1
			cmp		R7,#0
			beq		notDes
			b		xorDes
notDes:
			ldr		R6,[R9]
			mvn		R6,R6
			str		R6,[R10]
			add		R9,R9,#1
			add 	R10,R10,#1
			b		columnIterator
xorDes:
			ldr		R6,[R9]
			eor		R6,R6,R8
			str		R6,[R10]
			add		R9,R9,#1
			add 	R10,R10,#1
			b		columnIterator
endEncr: