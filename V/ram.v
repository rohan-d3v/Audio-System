/*
Rohan Krishna Ramkhumar, rxr353
Ram writer
*/
module ram(
			 input clk,
			 input [9:0] pxl,
			 input [8:0] line,
			 output reg [8:0] write,
			 output reg en                               
			 );
			 
reg [1:0] const;

initial
	begin
		write = 271;
		en = 0;
	end
	
always @(posedge clk)
	begin
		if (line == 270)
			begin
				if (pxl ==478)
					const <=const+1;
				
				//writes Peak to RAM ever 4 frames after decrement
				if (const == 3 && pxl ==478)
					begin
						if (write !=0)
							write <= write -1;
						else
							write <=271;
						
						en = 1;
					end
				else
					en = 0;
			end
		else
			en = 0;
	end
endmodule
		