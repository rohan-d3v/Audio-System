/*
Rohan Krishna Ramkhumar, rxr353
Sydney Tenaglia, snt21

Modified from lab 2
Calculations same as pwmmod
*/

module pwm(
			input clk,
			input [11:0] in,
			output reg [1:0] signal
			);
			
reg [7:0] cnt;

always @(posedge clk)
	begin
		if (cnt == 8'd249)
			cnt <=0;
		else
			cnt <= cnt + 1;
		
		if (in [11:4] < cnt)
			signal <= 2'b10;
		else
			signal <=2'b01;
	end
endmodule
