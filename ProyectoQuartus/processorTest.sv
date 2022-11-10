`timescale 10ns/10ns
module processorTest();

	logic rst,clk,WR,MemtoReg;
	logic [7:0] address;
	logic [31:0] writeData,instruction,readData;
	processor myProcessor(.rst(rst),.clk(clk),.readData({24'b0,address}),.instruction(instruction),.WR(WR),.address(address),.writeData(writeData),.MemtoRegOut(MemtoReg));
	
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
		instruction=32'he3a00007;  //mov r0,#7
		

		
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
		instruction=32'he1500003;
		
		
		#10;//negedge
		
		
		#100;

	
	end

endmodule 