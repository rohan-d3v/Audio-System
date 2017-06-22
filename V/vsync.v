/*
Rohan Krishna Ramkhumar, rxr353
Sydney Tenaglia, snt21

Modified video sync module from lab 5 due to column split
line is the validity check, if 1, cycles should start for output
*/
module vsync(
					input hsync,
					output vsync,
					output line,			
					output [8:0] cntline		
					);

reg vtmp = 1;
reg [8:0] cnt = 0;				
reg tmp = 0;
reg [8:0] cnttmp = 0;


assign vsync = vtmp;
assign line = tmp;
assign cntline = cnttmp;

always@(negedge hsync)
	begin

		if (cnt == 0)//vsync
			vtmp <= 0;
		else if (cnt == 9'd10)
			vtmp <= 1;	
		if (cnt == 9'd12)//valid
			tmp <= 1;
		else if (cnt == 9'd283)
			tmp <= 0;
		if ((cnt >= 9'd12) && (cnt <= 9'd283))//line
			cnttmp <= cnt - 9'd12;
		else
			cnttmp <= 0;
		
		if(cnt == 9'd285)//counter
			cnt <= 0;
		else
			cnt <= cnt + 1;

	end
endmodule
