`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:16 10/11/2017 
// Design Name: 
// Module Name:    IR_reg 
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
module IR_reg(
	input [31:0]  D_Out,
	input      	clk, rst,
	input         ld,
	
	output reg [31:0] IR_out, 
	output reg [31:0] SE_16);

	always@(posedge clk, posedge rst) begin
		if(rst)
			{IR_out, SE_16} <=32'b0;
		else
			{IR_out, SE_16} <={D_Out, {{16{D_Out[15]}},D_Out[15:0]}};
	end
endmodule
