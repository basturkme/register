module Register #(parameter W=4)(
	input clk, we, reset,
	input [W-1:0] in,
	output reg [W-1:0] out
);



	always@(posedge clk) begin
		if (reset)
			out<=0;
	
		else if (we)
			out<=in;

	
	end

endmodule

