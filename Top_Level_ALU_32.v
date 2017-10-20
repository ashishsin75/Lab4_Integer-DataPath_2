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
module Top_Level_ALU_32(Opcode, SData, TData, y_hi, y_lo, n, z, v, c);
//	INPUTS	-----------------------------------------------------------------
	input 	[4:0]		Opcode;
	input 	[31:0]	SData, TData;
//	OUTPUTS	-----------------------------------------------------------------
	output	[31:0]	y_hi, y_lo;
	output				n, z, v, c;
	
// module ALU_32(FS, S, T, Y_Hi, Y_Low, N, Z, V, C);
	ALU_32	ALU0(.FS(Opcode), .S(SData), .T(TData), .Y_Hi(y_hi), .Y_Low(y_lo), 
					  .N(n), .Z(z), .V(v), .C(c));

endmodule
