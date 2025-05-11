module Register_File #(// This is a template. 
// You can modify the input-output declerations(width etc.) without changing the names.
    parameter W = 4              // Data width parameter (default 4 bits)
) (
    input CLK,                 // Clock signal
    input Reset,               // Reset signal (active high)
    input [W-1:0] Data,        // W-bit data input
    input [2:0] Destination_Select,  // 3-bit write address
    input  Write_Enable,        // Write enable signal
    input [2:0] Source_Select_0,  // 3-bit read address for port 0
    input [2:0] Source_Select_1,  // 3-bit read address for port 1
    output [W-1:0] Out_0,       // W-bit output for port 0
    output [W-1:0] Out_1        // W-bit output for port 1
);

// Fill here
initial begin
    $monitor("t=%0t: Dest=%0d, WE=%0b, Data=%0d, Out0=%0d", $time, Destination_Select, Write_Enable, Data, Out_0);
end

wire [7:0] andwe; 


dec3to8 my_dec(
.i(Destination_Select),
.out(andwe)
);

wire [7:0] we;
assign we = andwe & {8{Write_Enable}};

wire [W-1:0] register_outarray [7:0];

genvar i;
	generate
		for(i=0; i<8; i=i+1) begin: connections
		
			Register #(.W(W)) my_register(
			.clk(CLK),
			.we(we[i]),
			.reset(Reset),
			.in(Data),
			.out(register_outarray[i])
			);
		end
	endgenerate

wire [W-1:0] out0_wire, out1_wire;

mux8to1 #(.W(W)) my_mux0(
.d0(register_outarray[0]),
.d1(register_outarray[1]),
.d2(register_outarray[2]),
.d3(register_outarray[3]),
.d4(register_outarray[4]),
.d5(register_outarray[5]),
.d6(register_outarray[6]),
.d7(register_outarray[7]),
.select(Source_Select_0),
.out(out0_wire)
);
assign Out_0 = out0_wire; 

mux8to1 #(.W(W)) my_mux1(
.d0(register_outarray[0]),
.d1(register_outarray[1]),
.d2(register_outarray[2]),
.d3(register_outarray[3]),
.d4(register_outarray[4]),
.d5(register_outarray[5]),
.d6(register_outarray[6]),
.d7(register_outarray[7]),
.select(Source_Select_1),
.out(out1_wire)
);
assign Out_1 = out1_wire;
		
endmodule