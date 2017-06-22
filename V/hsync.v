/*
Rohan Krishna Ramkhumar, rxr353
Sydney Tenaglia, snt21

Modified video sync module from lab 5 due to column split
Modified vsync module for hsync
*/
module hsync(
	input clk,									
	input line, 						
	output hsync,								
	output out,							
	output [9:0] pxl				
);
			
	reg htmp = 1;
	reg [9:0] cnt = 0;					
	reg [9:0] pxltmp = 0;		
	reg outtmp;
	
	assign hsync = htmp;
	assign out = outtmp;
	assign pxl = pxltmp;
	
	always@(posedge clk)
		begin
			
			if (cnt == 0)
				htmp <= 0;
			if (cnt == 10'd41)
				htmp <= 1;
			
			if ((line) && (cnt >= 10'd43) && (cnt <= 10'd522))
				begin
					pxltmp <= cnt - 10'd43;
					outtmp <= 1;
				end
			else													
				begin
					pxltmp <= 0;
					outtmp <= 0;
				end				
					
			
			if(cnt == 10'd524)//counter
				cnt <= 0;
			else
				cnt <= cnt + 1;
			
		end

	endmodule
