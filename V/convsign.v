/*
Rohan Krishna Ramkhumar, rxr353
Converts input to binary
*/
module convsign(
					input [11:0] in,
					output [11:0] out
					);

reg [11:0] outtmp;
reg [11:0] tmp;
assign out = outtmp;

always 
	begin
		if (in[11] == 0)
			tmp = in + 12'b100000000000;
		else
			tmp = ~in;
		
		outtmp = tmp + 12'b100000000000;
	end
endmodule
