module peach2_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [11:0] q
);

logic [11:0] memory [0:5393] /* synthesis ram_init_file = "./peach2/peach2.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
