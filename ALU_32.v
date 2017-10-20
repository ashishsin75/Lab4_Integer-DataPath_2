`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  ALU_32.v
 * Project:    Lab_Assignment_1
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/4/2017 
 *
 * Purpose:		The purpose of this module is to serve as a wrapper which 
 *					essential duty is to serve as a mux for the FS opcode 
 *					selected. I implemented this functionality using a case 
 *					statement. 
 *
 * Notes:		
 *
 ****************************************************************************/
module ALU_32(FS, S, T, Y_Hi, Y_Low, N, Z, V, C);
//	INPUTS	-----------------------------------------------------------------
	input			[4:0]			FS;
	input			[31:0]		S, T;
//	OUTPUTS	-----------------------------------------------------------------
	output reg	[31:0]		Y_Hi, Y_Low;
	output reg					N,V,C;
	output wire					Z;
//	PARAMETER	--------------------------------------------------------------	
	parameter	MUL = 5'H1E, DIV = 5'H1F, ADDU = 5'H03, SUBU = 5'H05;
//	INTERNAL WIRE	-----------------------------------------------------------
	wire 			[31:0]		Y_Hi_DIV, Y_Low_DIV;
	wire 			[31:0]		Y_Hi_MUL, Y_Low_MUL;
	wire 			[31:0]		Y_Hi_MIPS, Y_Low_MIPS;
	wire 							V_DIV, V_MUL, V_MIPS;
	wire							C_DIV, C_MUL, C_MIPS;
	wire							Z_DIV;

// module MPY_32(S, T, Y_Hi, Y_Low, V, C);
	MPY_32 M0(.S(S), .T(T), .Y_Hi(Y_Hi_MUL), .Y_Low(Y_Low_MUL), 
				 .V(V_MUL), .C(C_MUL));
				 
// module DIV_32(S, T, Y_Hi, Y_Low, V, C, Z);
	DIV_32 D0(.S(S), .T(T), .Y_Hi(Y_Hi_DIV), .Y_Low(Y_Low_DIV), 
				 .V(V_DIV), .C(C_DIV), .Z(Z_DIV));
				 
//	module MIPS_32(FS, S, T, Y_Hi, Y_Low, V, C);
	MIPS_32 MPS0(.FS(FS), .S(S), .T(T), .Y_Hi(Y_Hi_MIPS), .Y_Low(Y_Low_MIPS), 
					 .V(V_MIPS), .C(C_MIPS));
					 
//	MUX: MUL || DIV || MIPS		-----------------------------------------------
// SET OVERFLOW/CARRY FLAGS	-----------------------------------------------
	always@(*)begin
		case(FS)
		MUL:	{V, C, Y_Hi, Y_Low} = {V_MUL, C_MUL, Y_Hi_MUL, Y_Low_MUL};
		
		DIV:	{V, C, Y_Hi, Y_Low} = {V_DIV, C_DIV, Y_Hi_DIV, Y_Low_DIV};		
		default: begin
					{V, C, Y_Hi, Y_Low} = {V_MIPS, C_MIPS, Y_Hi_MIPS, Y_Low_MIPS};
				  end
		endcase
	end
	
//	SET ZERO FLAG	-----------------------------------------------------------
// Spec: Zero Flag is set to z: High Impedence if DIV divides with 0 on denom 
	assign Z = (FS == DIV) ? Z_DIV :
				  ({Y_Hi, Y_Low} == 32'H0) ? 1'b1 : 1'b0;
	
//	SET NEGATIVE FLAG	--------------------------------------------------------
	always@(*)begin
		case(FS)
		
		MUL:	N = Y_Hi_MUL[31];
		
		DIV:	N = Y_Low_DIV[31];
		
		ADDU:	N = 1'b0;
		
		SUBU:	N = 1'b0;
		default:	N = Y_Low_MIPS[31]; 
		endcase
	end
endmodule

