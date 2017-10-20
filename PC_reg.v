`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:17 10/11/2017 
// Design Name: 
// Module Name:    PC_reg 
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
module PC_reg(
	input [31:0] PC_in,
	input          clk,
	input          rst,
	input 		 pc_ld,
	input       pc_inc,
	
	output reg [31:0] PC_out);
	
	always @(posedge clk, posedge rst) begin
		if(rst)
			PC_out <= 32'b0;
		else begin
			case ({pc_ld, pc_inc})
				2'b00 : PC_out <= PC_out;			//no load , no inc
				2'b01 : PC_out <= PC_out + 4;		//no load, inc
				2'b10 : PC_out <= PC_in;			//load,  no inc
				2'b11 : PC_out <= PC_out;			//load, inc not possible
				default: PC_out <= PC_out;
			endcase
		end
	end
endmodule
