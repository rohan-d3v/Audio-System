/*
Rohan Krishna Ramkhumar, rxr353
Motor max frequency = 100 Khz
Max PWM frequency = 50KHz (uses 25 KHz)
1 cycle = 250 clocks (50/4 = 12.5 MHz clock)
*/
module pwmmod(
				input in,
				input [11:0] cycle,
				output reg [11:0] pwmmod
				);
				
reg cnt = 0;

always @(posedge in)
	begin
		if (cnt == 0)
			cnt <= cnt + 1;
		else
			begin
				pwmmod <= cycle;
				cnt <=0;
			end
	end
endmodule
