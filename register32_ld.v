`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:07 10/15/2017 
// Design Name: 
// Module Name:    register32_ld 
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
module register32_ld(
    input clk,
    input rst,
    input load,
    input [31:0] D,
    output reg [31:0] Q
    );
	
	always@(posedge clk, posedge rst) begin
		if(rst) 
			Q <= 32'b0;
		else if(load)
			Q <= D;
		else 
			Q <= Q;
	end


endmodule
