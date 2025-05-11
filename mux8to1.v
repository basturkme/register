module mux8to1 #(parameter W=8)(
	input [W-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
	input [2:0] select,
	output reg [W-1:0] out
);

	always@ (*) begin
		case(select)
			3'd0 : out=d0;			
			3'd1 : out=d1;
			3'd2 : out=d2;
			3'd3 : out=d3;
			3'd4 : out=d4;
			3'd5 : out=d5;
			3'd6 : out=d6;
			3'd7 : out=d7;
		default: out = {W{1'bx}};
		endcase
	end
endmodule