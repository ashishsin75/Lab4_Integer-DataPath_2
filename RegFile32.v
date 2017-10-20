`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  RegFile32.v
 * Project:    Lab_Assignment_2
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/17/2017 
 *
 * Purpose:		This module serves as a 32-bit register file which declares 
 *					32 registers each of 32-bits , 32x32. Futhermore, the input 
 *					D is the 32-bit data available to be written to the register
 *					stated by address specified by D_Addr. The data will be written
 *					if and only if the D_En is asserted and if not writing to $r0. 
 *					Additionally, S and T are outputs which will output the values
 *					in regsiters specified by their respective register address 
 *					location specifier S_Addr and T_Addr. 
 *					
 * Notes:		Both S and T ports are 'asynchronous' outputs. 
					D data-lines are the inputs to the register file. Which 
					register to write to is 'synchronously controlled' by the clock
					in conjuction with the D_Addr address input. This register,
					specified by D_Addr is to only be written to on the rising
					edge of the clock if and only if D_En is asserted. 
 ****************************************************************************/
module RegFile32(D_En, D, S, T, D_Addr, S_Addr, T_Addr, clk, rst);
//	INPUTS	-----------------------------------------------------------------	
	input 				clk, rst, D_En;
	input 	[4:0]		D_Addr, S_Addr, T_Addr;
	input 	[31:0]	D;
//	OUTPUTS	-----------------------------------------------------------------
	output	[31:0]	S, T;
// 32 REGISTERs of 32-BITS EACH	--------------------------------------------
	reg		[31:0]	Register[31:0]; 
// BEHAVIORAL BLOCK	--------------------------------------------------------
	always@(posedge clk, posedge rst)begin
		// If reset register $ro gets all 32-bits of 0
		if(rst)begin	
			Register[0] <= 32'H00;
		// Write to register specified by D_Addr only if enable is high $ ~ $r0
		end else if(D_En && (D_Addr != 5'b0_0000))begin	
			Register[D_Addr] <= D;
		end
			Register[0] <= 32'H00;
	end
	// S and T will output the 32-bit value in the register specified by 
	// its respective S_Addr and T_Addr
	assign S = Register[S_Addr]; 
	assign T = Register[T_Addr];
endmodule

