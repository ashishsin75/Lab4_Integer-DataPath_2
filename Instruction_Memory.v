`timescale 1ns / 1p
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:35:40 10/11/2017 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(clk, im_cs, im_wr, im_rd, Address, D_In, D_Out
    );
	 
	input              clk, im_cs, im_wr, im_rd;
	input       [31:0] Address;
	input       [31:0] D_In;
	
	output wire [31:0] D_Out;
	
	reg         [7:0]  imem[0:4095]; //4096x8 -->1x32
	
	// write big endian
	always@ (posedge clk) begin
		   if (im_cs && im_wr) begin
		      imem[Address[11:0]]        <= D_In[31:24];   
            imem[Address[11:0] + 2'd1] <= D_In[23:16];				
				imem[Address[11:0] + 2'd2] <= D_In[15:8];		
				imem[Address[11:0] + 2'd3] <= D_In[7:0];		
			end
   end
		
	// read
	assign D_Out = (im_cs && im_rd) ? {imem[Address[11:0]], 
	                                   imem[Address[11:0] + 2'd1], 
										        imem[Address[11:0] + 2'd2],
										        imem[Address[11:0] + 2'd3]} : 32'hZ;endmodule
