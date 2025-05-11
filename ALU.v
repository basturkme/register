module ALU #(parameter W=8) (
input [1:0] Control,
input [W-1:0] DATA_A, DATA_B,
output reg [W-1:0] Result

);

always@(*) begin
	case(Control)
		2'b00: Result = (DATA_A+DATA_B);
		2'b01: Result = (DATA_A-DATA_B);
		2'b10: Result = (~DATA_B);
		default: Result = {W{1'bx}};
	endcase
end
endmodule
		