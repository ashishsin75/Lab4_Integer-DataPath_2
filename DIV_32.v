`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  DIV_32.v
 * Project:    Lab_Assignment_1
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/4/2017 
 *
 * Purpose:		This module is a 32-bit divider Arithmetic Logic Unit
 *					Operation, it will divide two 32-bit inputs and output a 
 *					32-bit quotient and remainder; S/T
 *
 * Notes:		S and T:	32-bit inputs S/T
 *					Y_Hi:		Remainder
 *					Y_Low:	Quotient
 *
 ****************************************************************************/
module DIV_32(S, T, Y_Hi, Y_Low, V, C, Z);
//	INPUTS	-----------------------------------------------------------------
	input 		[31:0] 	S, T;					//	Inputs S-numerator T-denominator
//	OUTPUTS	-----------------------------------------------------------------
	output reg	[31:0]	Y_Hi, Y_Low;		// Quotient and Remainder
	output reg				V, C;
	output reg				Z;
//	INTEGER	-----------------------------------------------------------------		
	integer					Int_S, Int_T;		//	Integers for signed
//	DIV		-----------------------------------------------------------------		
	always@(*)begin
		Int_S	= 	S;
		Int_T	= 	T;
		// This is placing remainder in Y_Hi, and quotient in Y_Lo
		{Y_Hi, Y_Low} = {Int_S % Int_T, Int_S / Int_T};
		{V,C} = {2'bx};
		if(Int_T == 0) Z = 1'bz;
	end
endmodule
