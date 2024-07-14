`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2024 01:09:50 PM
// Design Name: 
// Module Name: TomBrady
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TomBrady();

logic		clk;
logic 		reset;

logic 		run_i;
logic 		continue_i;
logic [15:0] sw_i;

logic [15:0] led_o;
logic [7:0]  hex_seg_left;
logic [3:0]  hex_grid_left;
logic [7:0]  hex_seg_right;
logic [3:0]  hex_grid_right;

processor_top p(.*);
logic [15:0] pc = p.slc3.cpu.pc;
logic [15:0] ir = p.slc3.cpu.ir;

always begin : CLOCK_GENERATION
#1 clk = ~clk;
end

initial begin : CLOCK_INITIALIZATION
    clk = 0;
end 

initial begin : test_vectors
    continue_i = 0;
    run_i = 0;
    #2 sw_i = 16'h009C;
    #10 run_i = 1'b1;
    #100 run_i = 1'b0;
end


endmodule
