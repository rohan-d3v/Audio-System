/*
Rohan Krishna Ramkhumar, rxr353
Outputs the peak in given time
*/
module detector(
					input clk,
					input valid,
					input [11:0] data,
					output [11:0] peak
					);
					
wire rst;

peakrst peakreset(.clk(clk), .rst(rst));
peakdetect detect(.clk(clk), .rst(rst), .valid(valid), .data(data), .peak(peak));

endmodule
