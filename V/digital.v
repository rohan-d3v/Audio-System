/*
Rohan Krishna Ramkhumar, rxr353
Sydney Tenaglia, snt21
Modified from lab 4
slow clock (clk) = 12.5 Mhz => 80ns per clock tick = 250 clock ticks
20000/80 (50 ksps/80)

analog to digital conversion module (ADC)

Reference used: http://www.analog.com/media/en/technical-documentation/data-sheets/AD7908_7918_7928.pdf
*/
module digital(
					input clk,
					input din,
					output dout,
					output [11:0] res,
					output cs,
					output valid
					);
					
reg [11:0] cmd = 12'b100000110000;

reg[15:0] shftin = 16'b0;
reg[15:0] shftout;
reg [7:0] cnt = 0;
reg [11:0] rtmp;
reg cstmp = 1;
reg vtmp = 0;
reg outtmp;
//Output
assign cs = cstmp;
assign res = rtmp;
assign dout = outtmp;
assign valid = vtmp;

always @(posedge clk)
	begin
	//Chip
		if(cnt < 16)
				cstmp <= 0;
			else
				cstmp <= 1;
			//Shift in
			if(cnt > 0 & cnt <= 16)
				shftin <= {shftin[14:0], din};
			else if(cnt == 17)
				begin
					rtmp <= shftin[11:0];
				end
			//Shift out
			if(cnt < 16)
				begin
					outtmp = shftout[15];
					shftout = shftout << 1;
				end
			else if(cnt == 16)
				shftout <= {cmd, 4'b0};
			//Valid output
			if(cnt == 18)
				vtmp <= 1;
			if(cnt == 19)
				vtmp <= 0;
			//Count
			if(cnt != 249)
				cnt <= cnt + 1;
			else
				cnt <= 0;
			

		end
endmodule
