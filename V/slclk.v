/*
Rohan Krishna Ramkhumar, rxr353
50/4=12.5 Did not want to use PLL. 
Original idea: 15 MHz clock
*/
module slclk(
				input clk,
				output reg slclk
				);
				
reg cnt = 0;

initial
	slclk = 0;
	
always @(posedge clk)
	begin
		if (cnt == 0)
			cnt <= cnt+ 1;
		else
			begin
				slclk <= ~slclk;
				cnt <=0;
			end
		end
endmodule
