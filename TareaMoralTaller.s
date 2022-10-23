	; start position of img
	mov r1, #0x500
	; selection of decryption type and xor key
	mov r12, #0x01 ; Selector
	mov r11, #0x27 ;  key
	;first 2 positions are the sizes of the img, first pos is file size, second pos is row size
	mov r2, #0x03
	str r2, [r1]
	
	mov r3, #0x01
	str r2, [r1, r3]
	
	mov r2, #0x00
	mov r3, #0x00
	bl initialVal

initialVal
	ldr r4, [r1]
	;if rows < rowsize
	cmp r2, r4
	blt decrypt_row
	b exit
	

decrypt_row
	; counter
	ldr r4, [r1] ; cargar cantidad por fila
	MLA r6, r4, r2, r3 ; (counter de fila * cantidad por fila) + counter columna
	ldr r5, [r1, r6] ; cargar datos de la imagen
	mov r7, #0x01 
	ldr r4, [r1, r7] ; cargar cantidad por columna
	; if counter Columnas>cantidad Columnas
	cmp r3, r4, r3 
	blt decrypt_col
	; adding one to row counter and reseting column counter
	mov r3, #0x00
	add r2, r2, #0x01
	b   initialVal
	
decrypt_col
	; if not decrypt
	cmp r12, #0x01
	beq not_dec
	bne xor_dec

not_dec
	mvn r5, r5
	str r5, [r6]
	add r3, r3, #0x01
	b decrypt_row

xor_dec
	EOR r5, r5, r11
	str r5, [r6]
	add r3, r3, #0x01
	b decrypt_row

exit
	mov r1, #0x00
	mov r2, #0x00
	mov r3, #0x00
	mov r4, #0x00
	mov r5, #0x00
	mov r6, #0x00
	mov r7, #0x00
	mov r8, #0x00
	mov r9, #0x00
	mov r10, #0x00
	mov r11, #0x00
	mov r12, #0x00

	
	