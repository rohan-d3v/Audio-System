/*
Rohan Krishna Ramkhumar, rxr353
Sydney Tenaglia, snt21

Modified convsign to convert 2's complement to signed binary
*/
module convunsign(
						input [11:0] in,
						output [11:0] out
						);


reg [11:0] tmp;
reg [11:0] outtmp;
assign out = outtmp;

always 
	begin
		if (in[11] == 12'b100000000000)//switches out of range 12 bit to range singed
			tmp = 12'b100000000001;
		else
			tmp = in;
		
		if (in[11] == 12'b100000000000)//2s complement
			outtmp = ~(tmp - 12'b1) + 12'b100000000000;
		else
			outtmp = tmp;
	end
endmodule