`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  MIPS_32.v
 * Project:    Lab_Assignment_1
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/4/2017 
 *
 * Purpose:		This module is all the remainding operations for the ALU, 
 *					NOT INCLUDING MULT and DIV. Additionally, will set the 
 *					appropriate flags.
 *						
 *
 *					*****	ARITHMETIC *****
 *					PASS_S, PASS_T, ADD, ADDU, SUB, SUBU, SLT, SLTU, 
 *					MUL and DIV are in their own module for the MUX to function
 * 
 *					*****	LOGIC	*****
 *					AND, OR, XOR, NOR, SLL, SRL, SRA, ANDI, ORI, XORI, LUI
 *
 *					*****	OTHER	*****					
 *					INC, DEC, INC4, DEC4, ZEROS, ONES, SP_INIT
 *
 * Notes:		S and T:	32-bit inputs S/T
 *
 ****************************************************************************/
	module MIPS_32(FS, S, T, Y_Hi, Y_Low, V, C);
//	INPUTS	-----------------------------------------------------------------
	input			[4:0]		FS;
	input			[31:0]	S,T;
//	OUTPUTS	-----------------------------------------------------------------
	output reg	[31:0]	Y_Hi, Y_Low;
	output reg				C,V;
//	INTEGER	-----------------------------------------------------------------		
	integer					Int_T, Int_S;
//	PARAMETER	--------------------------------------------------------------	
	parameter 
		PASS_S  = 5'H00,   PASS_T  = 5'H01,  ADD     = 5'H02, 
		ADDU    = 5'H03,   SUB     = 5'H04,  SUBU    = 5'H05, 
		SLT     = 5'H06,   SLTU    = 5'H07,  AND     = 5'H08, 
		OR      = 5'H09,   XOR     = 5'H0A,  NOR     = 5'H0B, 
		SLL     = 5'H0C,   SRL     = 5'H0D,  SRA     = 5'H0E, 
		INC     = 5'H0F,   DEC     = 5'H10,  INC4    = 5'H11, 
		DEC4    = 5'H12,   ZEROS   = 5'H13,  ONES    = 5'H14, 
		SP_INIT = 5'H15,   ANDI    = 5'H16,  ORI     = 5'H17, 
		XORI    = 5'H18,   LUI = 5'H19, 		 MUL		= 5'H1E,
		DIV	  = 5'H1F;
		// UNUSED = 1'bX, SET = 1'b1, OFF = 1'b0;
//	ALU		-----------------------------------------------------------------		
	always@(*)begin		
		Y_Hi = 32'H0;
		//	FS Decoder using case statement
		case(FS)		// Case to change based on the Function-Select: FS
		//	ARITHMENTIC		****************************************************
		PASS_S:	{V, C, Y_Low} = {2'bx, S};		
		
		PASS_T:	{V, C, Y_Low} = {2'bx, T};		
		
		ADD:		begin
						{C, Y_Low} = S + T;
						// SOP for overflow flag using K maps
						if ((S[31] & T[31] & ~Y_Low[31]) || 
							(~S[31] & ~T[31] & Y_Low[31])) 
								V = 1'b1;
						else 
							V = 1'b0;
					end  
					
		ADDU:		begin							//	Add-UNSIGNED
						{C, Y_Low} = S + T;	//	Adding effects the CARRY-flag
						V = C;					//	OVERGLOW = CARRY
					end
					
		SUB:		begin
					{C, Y_Low} = S - T;
					if ((~S[31] & T[31] & Y_Low[31]) || (S[31] & ~T[31] & ~Y_Low[31]))
							V = 1'b1;
					else 
						V = 1'b0;
					end
					
		SUBU:		begin
						{C, Y_Low} = S - T;
						V = C;
					end
					
		SLT:		begin
					// Cast the values S, T into integers
					Int_S = S;
					Int_T = T;
					//	Y_Low gets 1 if S < T is true, otherwise it gets 0
					Y_Low = (Int_S < Int_T) ? 32'H0001 : 32'H0000;
					{C, V} = 2'bx;		
					end
					
		SLTU:		begin
					// Cast the values S, T into integers
					//Int_S = S;
					//Int_T = T;
					//	Y_Low gets 1 if S < T is true, otherwise it gets 0
					Y_Low = (S < T) ? 32'H0001 : 32'H0000;
					{C, V} = 2'bx;		
					end
		
		AND:		{V, C, Y_Low} = {2'bx, (S & T)};
		
		OR:		{V, C, Y_Low} = {2'bx, (S | T)};
		
		XOR:		{V, C, Y_Low} = {2'bx, (S ^ T)};
		
		NOR:		{V, C, Y_Low} = {2'bx, ~(S | T)};
		
		SLL:		{V, C, Y_Low} = {1'bx, T[31], T<<1};
		
		SRL:		{V, C, Y_Low} = {1'bx, T[0], T>>1};
		
		SRA:		{V, C, Y_Low} = {1'bx, T[0], {T[31],T[31:1]}};
		
		INC:		begin
					{C, Y_Low} = S + 1;
					V = C;
					end
					
		DEC:		begin
					{C, Y_Low} = S - 1;
					V = C;
					end
					
		INC4:		begin
					{C, Y_Low} = S + 4;
					V = C;
					end

		DEC4:		begin
					{C, Y_Low} = S - 4;
					V = C;
					end
					
		ZEROS:	{V, C, Y_Low} = {2'bx, 32'H00000000};
		
		ONES:		{V, C, Y_Low} = {2'bx, 32'HFFFFFFFF};
		
		SP_INIT: {V, C, Y_Low} = {2'bx, 32'H3FC};
		
		ANDI: 	{V, C, Y_Low} = {2'bx, (S & {16'H0, T[15:0]})};  
		
		ORI: 		{V, C, Y_Low} = {2'bx, (S | {16'H0, T[15:0]})}; 
		
		XORI: 	{V, C, Y_Low} = {2'bx, (S ^ {16'h0, T[15:0]})};  
		
		LUI: 		{V, C, Y_Low} = {2'bx, {T[15:0], 16'H0}};        
		
		default: {V, C, Y_Low} = {2'bx, S};		// PASS_S			
		endcase
	end
endmodule


