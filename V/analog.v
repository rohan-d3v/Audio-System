/*
Rohan Krishna Ramkhumar, rxr353
Modified from lab 4
Digital to analog conversion module (DAC)
Reference used: http://www.analog.com/media/en/technical-documentation/data-sheets/AD5025_5045_5065.pdf
*/
module analog(
				input clk,
				input valid,
				input [11:0] din,
				output dout,
				output sync
				);
reg new = 0;
reg [31:0] out;
reg [5:0] cnt;
reg tmp;

initial 
	begin
		tmp <=1;
		cnt <=0;
	end
//Output
assign dout = out[31];
assign sync = tmp;

always @(posedge clk)
	begin
		if (valid)
			new <=1;
		//Shift register procedure
		if (new)
			begin
				if (cnt == 8'd0)
					begin
						out = {12'b0000000101111, din + 12'b100000000000, 8'b00000000};
						
						tmp <=0;
					end
				else if (cnt <8'd32)
					out <= out <<1;
				else if (cnt ==8'd32)
					begin
						tmp <=1;
						new <=0;
						cnt <=0;
					end
				if (new)
					cnt <= cnt+1;
			end
		end
endmodule
							