module VGA_Controller(
	input clk_25Mhz,
	input rst,
	input logic [7:0] colorInput,
	output logic nextPixel,
	output logic Hsync,
	output logic Vsync,
	output logic[7:0] Red,
	output logic[7:0] Green,
	output logic[7:0] Blue,
	output logic VGA_clk
);

logic enable_v_counter = 0;
logic[7:0] r_red,r_blue,r_green;

reg [15:0] H_count_value = 0; 
reg [15:0] V_count_value = 0;
	
always_ff @(posedge clk_25Mhz or posedge rst)
	begin
		if (rst)
			begin
			H_count_value <= 0; 
			V_count_value <= 0;
			end
		else
			begin
				if(H_count_value < 799) 
				begin
					H_count_value <= H_count_value + 1;
					enable_v_counter <= 0;
				end
			else
				begin
					H_count_value <= 0;
					enable_v_counter <= 1;
				end
			if(enable_v_counter == 1'b1)
				begin
				if(V_count_value <= 524)
					V_count_value <= V_count_value + 1;
				else 
					V_count_value <= 0;
				end
			end
	end

assign VGA_clk = clk_25Mhz;

assign Hsync = (H_count_value >= 0 && H_count_value < 96) ? 1:0;
assign Vsync = (V_count_value >= 0 && V_count_value < 2)  ? 1:0;

always_ff @(posedge clk_25Mhz)
	begin
		/*
		if(V_count_value > 395 && V_count_value < 515)
			begin
				r_red   = 8'h00;
				r_green = 8'h00;
				r_blue  = 8'h00;
							
			end
		*/
		assign Red = colorInput;
		assign Blue =  colorInput;
		assign Green = colorInput;
	end
endmodule