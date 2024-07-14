module waterfall_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [11:0] q
);

logic [11:0] memory [0:9999] /* synthesis ram_init_file = "./waterfall/waterfall.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
