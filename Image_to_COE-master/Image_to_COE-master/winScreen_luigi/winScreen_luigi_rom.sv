module winScreen_luigi_rom (
	input logic clock,
	input logic [14:0] address,
	output logic [11:0] q
);

logic [11:0] memory [0:19199] /* synthesis ram_init_file = "./winScreen_luigi/winScreen_luigi.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
