module simple_register #(parameter W=8)(
	input clk, we,
	input [W-1:0] in,
	output reg [W-1:0] out
);

initial begin 
		out<=0;
end

	always@(posedge clk) begin
		if (we==1'b1)
		
			out<=in;
	end
endmodule

