/*
Rohan Krishna Ramkhumar, rxr353
1 Pulse per 9 MHz clock
*/
module peakrst(
					input clk,
					output reg rst
					);
					
reg [11:0] cnt = 0;

always @(posedge clk)
	begin
		if (cnt ==12'b111111111111)
			rst <=1;
		else
			rst <=0;
			
		cnt <= cnt +1;
	end
endmodule
