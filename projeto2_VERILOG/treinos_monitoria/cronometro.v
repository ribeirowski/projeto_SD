module cronometro(clk, dis0, dis1);
	input clk;
	output [0:6] dis0, dis1;
	reg segundos = 0;
	reg [0:30] i = 0;
	reg [3:0] number, num0, num1;
	parameter segundo = 50000000;
	always @ (posedge clk) begin
		if(i == segundo) begin
			i <= 0;
			segundos <= segundos + 1;
		end
		else
			i <= i + 1;
	end
	always @ (number) begin
		num1 <= number % 10;
		num0 <= number / 10;
	end
	Sla (.number(num1), .display(dis0));
	Sla dec (num0, dis1);
	
	endmodule
	