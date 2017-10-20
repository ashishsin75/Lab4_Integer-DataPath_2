`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  Integer_DataPath_2.v
 * Project:    Lab_Assignment_4
 * Designer 1: J Jesus Perez Gonzalez
 * Designer 2: Ashish Singh
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Email:		Ashish.Singh01@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/6/2017 
 *
 * Purpose:		The purpose of this module is to structure the Integer 
 *					DataPath which utilizes the Register file with a MUX on the
 *					T side 32-bit output which is controlled by the T_Sel. The 
 *					Data will then fall into the ALU either on the S side or the 
 *					T Side and will perform the arithmetic instruction controlled
 *					by the FS, Function Select. For this specific lab the flags 
 *					are part of the ALU instance however they are just hanging and 
 *					not being used. The instructions result will be outputted from 
 *					the ALU by Y_Hi and Y_Low respectively into the HI and LO 
 *					registers as long as the HILO_Ld controller is high. Finally, 
 *					a Y-MUX, output mux will control the output from either 
 *					HI, LO, Y_Low, DY, or PC_In which is controlled by the MUX 
 *					controller Y_Sel. 
 *
 * Notes:		T-MUX: 0-DT, 1-T
					Y-MUX: 0-HI_Out, 1-LO_Out, 2-ALU_OUT_R, 3-D_IN_R, 4-PC_In
 *
 ****************************************************************************/
module Interger_DataPath_2(clk, rst, S_Addr, D_Addr, T_Addr, D_En, DA_Sel, DT,
									T_Sel, FS, C, V, N, Z, HILO_Ld, DY, PC_In, Y_Sel, 
								   ALU_OUT, D_OUT);
// Register File Inputs, Outputs, and Wires	--------------------------------
	input					clk, rst;
	input 				D_En;
	input					DA_Sel;
	input 	[4:0]		D_Addr, S_Addr, T_Addr;
	wire		[31:0]	S_Out, T_Out;
// T-MUX Inputs, Outputs, and Wires	-----------------------------------------				
	input		[31:0]	DT;
	input					T_Sel;
	output	[31:0]	D_OUT;
	wire		[31:0]	T_OUT;
// ALU Inputs, Outputs, and Wires	-----------------------------------------
	input		[4:0]		FS;
	output				C, V, N, Z;
	wire		[31:0]	Y_Hi_Out, Y_Low_Out;
// HI and LO regsiters and Input	--------------------------------------------
	reg		[31:0]	HI_R, LO_R;
	input  				HILO_Ld;
// Y-MUX Inputs, Outputs	--------------------------------------------------
	input 	[2:0]		Y_Sel;
	input 	[31:0]	DY, PC_In;
	output 	[31:0]	ALU_OUT;
// Register File Instance	--------------------------------------------------	
	// D Address MUX added based on DA_Sel
	wire [4:0] D_Addr_in;
	assign D_Addr_in = (DA_Sel) ? T_Addr : D_Addr; 
	
	//module RegFile32(D_En, D, S, T, D_Addr, S_Addr, T_Addr, clk, rst);
	RegFile32	REG1(.D_En(D_En), .D(ALU_OUT), .S(S_Out), .T(T_Out), 
						  .D_Addr(D_Addr_in), .S_Addr(S_Addr), .T_Addr(T_Addr), 
						  .clk(clk), .rst(rst));
						  
// T-MUX	--------------------------------------------------------------------
	assign T_OUT = (T_Sel) ? T_Out : DT;
// RT Reg	-----------------------------------------------------------------
	reg 		[31:0]	RT;
	//assign RT = T_OUT;
	assign D_OUT = RT;
// ALU_OUT_R Reg	-----------------------------------------------------------
	reg 		[31:0] 	ALU_OUT_R;
	//assign ALU_OUT_R = Y_Low_Out;
// D_IN_R Reg	--------------------------------------------------------------
	reg		[31:0]	D_IN_R;
	//assign D_IN_R = DY;
// RS Reg	-----------------------------------------------------------------
	reg 		[31:0]	RS;
	//assign RS = S_Out;
// ALU_32	-----------------------------------------------------------------
	//module ALU_32(FS, S, T, Y_Hi, Y_Low, N, Z, V, C);
	ALU_32	ALU0(.FS(FS), .S(RS), .T(RT), .Y_Hi(Y_Hi_Out), 
					  .Y_Low(Y_Low_Out), .N(N), .Z(Z), .V(V), .C(C));
					  
// HI_R, LO_R Behavioral Registers	-----------------------------------------
	always @(posedge clk, posedge rst)begin
		if (rst)
			{HI_R, LO_R} <= {64'H00000000};
		else if(HILO_Ld)
			{HI_R, LO_R} <= {Y_Hi_Out, Y_Low_Out};
		else
			{HI_R, LO_R} <= {HI_R, LO_R};
	end
// ALU_OUT_R, D_IN_R, RS, RT	Behavioral Registers	--------------------------
	always @(posedge clk, posedge rst)begin
		if (rst)
			{ALU_OUT_R, D_IN_R, RS, RT} <= {96'H0};
		else 
			{RT, ALU_OUT_R, RS, D_IN_R} <= {T_OUT, Y_Low_Out, S_Out, DY};
		/*	RT <= T_OUT;
			ALU_OUT_R <= Y_Low_Out;
			RS <= S_Out;
			D_IN_R <= DY; */
	end
// Y-MUX	--------------------------------------------------------------------		
	assign ALU_OUT = (Y_Sel == 3'H0) ? HI_R:
						  (Y_Sel == 3'H1) ? LO_R:			
						  (Y_Sel == 3'H2) ? ALU_OUT_R:	
						  (Y_Sel == 3'H3) ? D_IN_R:			
						  (Y_Sel == 3'H4) ? PC_In:		
												  Y_Low_Out;
						  	
endmodule
