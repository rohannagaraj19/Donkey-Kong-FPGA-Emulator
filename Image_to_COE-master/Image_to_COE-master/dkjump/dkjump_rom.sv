module dkjump_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [11:0] q
);

logic [11:0] memory [0:5627] /* synthesis ram_init_file = "./dkjump/dkjump.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
