module VGA_Controller(
	input clk_25Mhz,
	input rst,
	input[7:0] colorInput,
	output nextAddress,
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
logic[2:0] WaitingPixels = 0;
logic[13:0] nextPixel = 0;


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
		assign Red = colorInput;
		assign Blue =  colorInput;
		assign Green = colorInput;
	end

//Next address counter 
always_ff @(posedge clk_25Mhz or posedge rst)
	begin 
		if(rst)
			begin
				nextPixel = 0;
				WaitingPixels = 0;
			end
		else
			begin
				if (nextPixel <= 9999 && WaitingPixels == 3'b111)
					begin
						nextPixel = nextPixel + 1;
						WaitingPixels = 0;
					end
				else
					begin
						WaitingPixels = WaitingPixels + 1;
						nextPixel = 0;
					end
			end
	end
assign VGA_clk = clk_25Mhz;
assign nextAddress = nextPixel;
assign Hsync = (H_count_value >= 0 && H_count_value < 96) ? 1:0;
assign Vsync = (V_count_value >= 0 && V_count_value < 2)  ? 1:0;

endmodule 