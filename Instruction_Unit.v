`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:20 10/11/2017 
// Design Name: 
// Module Name:    Instruction_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Unit(
	input clk,          input rst,
	input pc_ld,        input pc_inc,
	input im_cs,        input im_wr,
	input im_rd,        input ir_ld, 
	input [31:0] PC_in, input [31:0] D_In,
	
	output wire [31:0] PC_out, output wire [31:0] IR_out,
	output wire [31:0] SE_16
    );

 // internal wire
 wire [31:0] IM_DOUT;
 
 // sign extend
 assign SE_16 = {{16{IR_out[15]}}, IR_out[15:0]};
 
 PC_reg pc0(.PC_in(PC_in), .clk(clk), .rst(rst), .pc_ld(pc_ld), .pc_inc(pc_inc), .PC_out(PC_out));
 
 Instruction_Memory IM0(.clk(clk), .im_cs(im_cs), .im_wr(im_wr), .im_rd(im_rd), .Address(PC_out),
					         .D_In(D_In), .D_Out(IM_DOUT));
 register32_ld IR0(.clk(clk), .rst(rst), .load(ir_ld), .D(IM_DOUT), .Q(IR_out));
 
endmodule
