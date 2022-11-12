`timescale 10ns/10ns
module processorTest();

	logic rst,clk,WR,MemtoReg;
	logic [31:0] address;
	logic [31:0] writeData,instruction;
	logic [7:0] pc;
	processor myProcessor(.rst(rst),.clk(clk),.readData({24'b0,address}),.instruction(instruction),.WR(WR),.address(address),.writeData(writeData),.MemtoRegOut(MemtoReg),.pc(pc));
	
	always begin
		#10;
		clk=!clk;
		
	end
	initial begin
		clk=1;
		rst=1;
		instruction=0;
		
		#10; //negedge
		rst=0;
		
		
		#10; //posedge
		instruction=32'he3a00002;  //mov r0,#2
		

		
		#10; //negedge
		
		
		
		
		#10; //posedge
		instruction=32'he2800002;  //add r0,r0,#2
		

		
		#10; //negedge
		
		
		
		
		
		#10; //posedge
		instruction=32'he3a01002;  //mov r1,#2
		

		
		#10; //negedge
		
		#10; //posedge
		instruction=32'he3a02003; //mov r2,#3
		
		
		#10; //negedge
		
		
		#10; //posedge
		instruction=32'he0813002; //add r3,r1,r2

		
		
		#10;//negedge
		
		
		
		#10; //posedge
		instruction=32'he1530000; //cmp r3,r0;
		
		
		#10;//negedge
		
		#10; //posedge
		instruction=32'hca00002c;  //  bgt a direccion 0x2c (deberia ser exitoso)
		
		#10; //negedge
		
		#10;//posedge
		instruction=32'hba00003c; //blt a direccion 0x3c (debe fallar)
		
		#10; //negedge
		
		#10; //posedge
		instruction=32'he1520000; //cmp r2,r0;
		
		
		#10;//negedge
		
		  
		  
		  
		#10; //posedge
		instruction=32'hca00004c;  //  bgt a direccion 0x4c (debe fallar)
		
		#10; //negedge
		
		#10;//posedge
		instruction=32'hba00005c; //blt a direccion 0x5c (debe ser exitoso)
		
		#10; //negedge
		
		#10;//posedge 
		instruction=32'hea00006c;  // b a direccion 6c (debe ser exitoso)
		
		
		
		#10; //negedge
		
		#10; //posedge
		instruction=32'he2400002;  //sub r0,r0,#2
		

		
		#10; //negedge
		
		/*
		
		#10; //posedge
		instruction=32'he1e00001; // mvn r0,r1
		
		#10; //negedge
		
		
		
		#10; //posedge
		instruction=32'he0210002; //eor r0,r1,r2
		
		#10; //negedge
		
		*/
		#10; //posedge 
		instruction=32'he3a04080;  //mov r4,#128
		
		#10; //negedge
		
		#10;//posedge
		instruction=32'he5946000; //ldr r6,[r4]
		
		#10;//negedge
		
		#10;//posedge
		instruction=32'he0844004; //add r4,r4,r4
		
		#10;//negedge
		
		#10;//posedge
		instruction=0;
		
		
		
		
		#100;
		$finish();

	
	end

endmodule 