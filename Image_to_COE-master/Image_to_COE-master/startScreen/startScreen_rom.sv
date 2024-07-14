module startScreen_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [11:0] q
);

logic [11:0] memory [0:76799] /* synthesis ram_init_file = "./startScreen/startScreen.COE" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
