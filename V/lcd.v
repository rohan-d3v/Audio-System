/*
Rohan Krishna Ramkhumar, rxr353
Vertical Scroll downward
Takes in the PLL (9Mhz) clock, 12 bit high and low data filters
Current write address (addr) input gives the read address
Valid is used to determine the clock cycle
line: current line
pixel (pixel position)
*/
module lcd(
			input clk,							
			input [11:0] high,			
			input [11:0] low,				
			input [8:0] addr,			
			input valid,					
			input [8:0] line, 			
			input [9:0] pxl,			
			output reg [7:0] red,
			output reg [7:0] green,
			output reg [7:0] blue,
			output reg [8:0] read			//output read address
			);
reg [11:0] datalow;
reg [11:0] datahigh;

reg [8:0] first;		//the first output address				
reg [9:0] buffer;	  

always
	begin
		datalow <= low;
		datahigh <= high;
	end

always@(posedge clk)
	begin
		if (valid)
			begin 
				if (pxl >= 96 && pxl <= 191)//High peak val
					begin
						red <= {datahigh[11:6], 2'b0};
						green <= {datahigh[5:2], 4'b0};
						blue <= {3'b0, datahigh[1:0], 3'b0};
					end
				
				else if (pxl >= 287 && pxl <= 383)//low peak val
					begin
						blue <= {datalow[11:6], 2'b0};
						green <= {datalow[5:2], 4'b0};
						red <= {3'b0, datalow[1:0], 3'b0};
					end
					
				else //green/blue background. This is a approximation
					begin
						red <= 8'h00;
						green <= 8'h00;
						blue <= 8'h00;
					end
			end
		else
			begin
				red <= 8'h00;
				green <= 8'h00;
				blue <= 8'h00;
			end
			
		//Read address
		if (line == 0)
			first <= addr;
		
		buffer <= first + line;
		
		if (buffer >= 10'd272)
			read <= buffer - 10'd272;
		else
			read <= buffer;
	
	end
endmodule
