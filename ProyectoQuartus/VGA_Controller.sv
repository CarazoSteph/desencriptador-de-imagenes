module VGA_Controller(
	input clk_25Mhz,
	input rst,
	input[7:0] colorInput,
	output [15:0] nextAddress,
	output logic Hsync,
	output logic Vsync,
	output logic[7:0] Red,
	output logic[7:0] Green,
	output logic[7:0] Blue,
	output logic VGA_clk
);

logic enable_v_counter = 0;
logic[7:0] r_red,r_blue,r_green;


//Pixel Logic
logic[15:0] nextPixel = 0;


reg [15:0] H_count_value = 0; 
reg [15:0] V_count_value = 0;

//Vertical and Horizontal Counters
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
// Assign Colors to Output
always_ff @(posedge clk_25Mhz)
	begin
		if((H_count_value > 144 && H_count_value < 246) && (V_count_value > 35 && V_count_value < 137))
			begin
				Red = colorInput;
				Blue =  colorInput;
				Green = colorInput;
			end
		else
			begin
				Red   = 8'h00;
				Green = 8'h00;
				Blue  = 8'h00;
			end
	end

//Next address counter 
always_ff @(posedge clk_25Mhz or posedge rst)
	begin 
		if(rst)
			begin
				nextPixel = 0;
			end
		else
			begin
				if((H_count_value > 144 && H_count_value < 245) && (V_count_value > 35 && V_count_value < 136))
					begin
						if (nextPixel <= 9999)
							begin
								nextPixel = nextPixel + 1;
							end
						if (nextPixel > 9999)
							begin
								nextPixel = 0;
							end
					end
			end
	end
assign VGA_clk = clk_25Mhz;
assign nextAddress = nextPixel;
assign Hsync = (H_count_value >= 0 && H_count_value < 96) ? 1:0;
assign Vsync = (V_count_value >= 0 && V_count_value < 2)  ? 1:0;

endmodule 