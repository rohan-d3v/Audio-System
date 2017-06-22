/*
Rohan Krishna Ramkhumar, rxr353
Holds read address and uses continual assignment to return new data
This is the same idea as is used in single port mode
*/
module dualram(
					input [11:0] data,
					input [8:0] writein,
					input [8:0] readin,
					input en,
					input clk,
					output [11:0] writeout,
					output [11:0] readout
					);
reg [11:0] ram [512:0];

reg [8:0] addrread;
reg [8:0] addrwrite;


assign writeout = ram[addrwrite];
assign readout = ram[addrread];

always @(posedge clk)
	begin
		if (en)
			ram[addrwrite]<=data;
		
		addrread <=readin;
		addrwrite <= writein;
	end
endmodule

