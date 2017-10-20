`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  Top_Level_Integer_DataPath_2.v
 * Project:    Lab_Assignment_4
 * Designer 1: J Jesus Perez Gonzalez
 * Designer 2: Ashish Singh
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Email:		Ashish.Singh01@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/6/2017 
 *
 * Purpose:		
 *
 * Notes:		
 ****************************************************************************/
module Top_Level_Integer_DataPath_2(CLK, RST, S_ADDR, D_ADDR, T_ADDR, D_EN, 
												DT, T_SEL, C, V, N, Z, PC_IN, 
												Y_SEL, FS, HILO_LD, DM_CS, DM_WR, DM_RD);
	input 			CLK, RST, D_EN;
	input				HILO_LD, DM_CS, DM_WR, DM_RD;
	input [4:0]		S_ADDR, T_ADDR, D_ADDR, FS;
	input [31:0]	DT, PC_IN;
	input 			T_SEL;
	input [2:0]		Y_SEL;
	output			C, V, N, Z;
	wire 	[31:0]	ALU_OUT_W, D_OUT_W;
	wire	[31:0]	D_OUT_DY;
/* module Interger_DataPath_2(clk, rst, S_Addr, D_Addr, T_Addr, D_En, DT, T_Sel, 
								 FS, C, V, N, Z, HILO_Ld, DY, PC_In, Y_Sel, 
								 ALU_OUT, D_OUT);			
*/
// Will only use [11:0] of ALU_OUT_W for Address of Data Memory instance
Interger_DataPath_2 ID2_0(.clk(CLK), .rst(RST), .S_Addr(S_ADDR), .D_Addr(D_ADDR),
								 .T_Addr(T_ADDR), .D_En(D_EN), .DT(DT), .T_Sel(T_SEL), .FS(FS),
								 .C(C), .V(V), .N(N), .Z(Z), .HILO_Ld(HILO_LD), 
								 .DY(D_OUT_DY), .PC_In(PC_IN), .Y_Sel(Y_SEL), 
								 .ALU_OUT(ALU_OUT_W), .D_OUT(D_OUT_W));
// ALU_OUT[11:0] b/c 2^12 = 4096, this is to access the memory address
// module Data_Memory(clk, rst, Address, D_In, dm_cs, dm_wr, dm_rd, D_Out);
Data_Memory DM0(.clk(CLK), .Address({20'b0, ALU_OUT_W[11:0]}), .D_In(D_OUT_W), 
					 .dm_cs(DM_CS), .dm_wr(DM_WR), .dm_rd(DM_RD), .D_Out(D_OUT_DY));
								 


endmodule
