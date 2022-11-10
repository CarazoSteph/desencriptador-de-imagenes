module registerBankTest();
	logic clk,rst;
	logic [3:0] A1,A2,A3;
	logic WE3;
	logic [31:0] R15,WD3;
	logic [31:0] RD1,RD2;
	
	registerBank myregisterBank(.clk(clk),.rst(rst), .A1(A1), .A2(A2), .A3(A3), .WE3(WE3),.WD3(WD3),.R15(R15),.RD1(RD1),.RD2(RD2));
	
	always begin
	
		#10;
		clk=!clk;
	
	end
	initial begin
		rst=1;
		clk=0;
		A1=0;
		A2=1;
		A3=2;
		WE3=0;
		WD3=0;
		R15=0;
		
		#10; //posedge
		rst=0;
		WE3=1;
		WD3=32'h3e;
		
		#10;//negedge
		A1=2;
		
		
		#10; //posedge
		WE3=0;
		
		#100;
		$finish();
		
	end

endmodule 