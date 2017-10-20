`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MPY_32.v
 * Project:    Lab_Assignment_1
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/4/2017 
 *
 * Purpose:		This module is a 32-bit multiplier, it will multiply two 32-bit
 *         		inputs and output a 64-bit product broken into 2, 32-bit 
 *					portions, {Y_Hi, Y_Low}. Additionally, it will set the V and C 
 *					flags to DONT-CARE, X as those flags are not effected by the MUL, 
 *					ALU Operation. 
 *
 * Notes:		S and T:				32-bit Inputs S*T
 *					{Y_Hi,Y_Low}:		64-bit product
 *
 ****************************************************************************/
module MPY_32(S, T, Y_Hi, Y_Low, V, C);
//	INPUTS	-----------------------------------------------------------------
	input			[31:0]	S,T;		// S and T are 32-bit operands
//	OUTPUTS	-----------------------------------------------------------------
	output reg	[31:0]	Y_Hi, Y_Low;		//	Product results in a 64'#{Hi,Lo}
	output reg				V, C;					// Overflow, Carry (Flags)
//	INTEGER	-----------------------------------------------------------------	
	integer 					Int_S, Int_T;		//	Integers for signed
//	MUL		-----------------------------------------------------------------		
	always@(*)begin
		Int_S = S;
		Int_T = T;
		{Y_Hi,Y_Low} = Int_S * Int_T;			// Product of MULT OP
		{V, C} = {2'bx};							// Set Overflow anc Carry to x
	end
endmodule

