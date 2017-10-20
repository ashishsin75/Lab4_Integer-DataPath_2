`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  Integer_DataPath.v
 * Project:    Lab_Assignment_3
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/21/2017 
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
					Y-MUX: 0-HI_Out, 1-LO_Out, 2-Y_Low, 3-DY, 4-PC_In
 *
 ****************************************************************************/
module Interger_DataPath(clk, rst, S_Addr, D_Addr, T_Addr, D_En, DT, T_Sel, 
								 FS, C, V, N, Z, HILO_Ld, DY, PC_In, Y_Sel, 
								 ALU_OUT, D_OUT);
// Register File Inputs, Outputs, and Wires	--------------------------------
	input					clk, rst;
	input 				D_En;
	input 	[4:0]		D_Addr, S_Addr, T_Addr;
	wire		[31:0]	S_Out, T_Out;
// T-MUX Inputs, Outputs, and Wires	-----------------------------------------				
	input		[31:0]	DT;
	input					T_Sel;
	output	[31:0]	D_OUT;
	wire		[31:0]	D_OUT;
// ALU Inputs, Outputs, and Wires	-----------------------------------------
	input		[4:0]		FS;
	output				C, V, N, Z;
	wire		[31:0]	Y_Hi_Out, Y_Low_Out;
// HI and LO regsiters and Input	--------------------------------------------
	reg		[31:0]	HI_Out, LO_Out;
	input  				HILO_Ld;
// Y-MUX Inputs, Outputs	--------------------------------------------------
	input 	[2:0]		Y_Sel;
	input 	[31:0]	DY, PC_In;
	output 	[31:0]	ALU_OUT;
// Register File Instance	--------------------------------------------------	
	//module RegFile32(D_En, D, S, T, D_Addr, S_Addr, T_Addr, clk, rst);
	RegFile32	REG0(.D_En(D_En), .D(ALU_OUT), .S(S_Out), .T(T_Out), 
						  .D_Addr(D_Addr), .S_Addr(S_Addr), .T_Addr(T_Addr), 
						  .clk(clk), .rst(rst));
						  
// T-MUX	--------------------------------------------------------------------
	assign D_OUT = (T_Sel) ? T_Out : DT;
	
// ALU_32 Instance	--------------------------------------------------------
	//module ALU_32(FS, S, T, Y_Hi, Y_Low, N, Z, V, C);
	ALU_32	ALU0(.FS(FS), .S(S_Out), .T(D_OUT), .Y_Hi(Y_Hi_Out), 
					  .Y_Low(Y_Low_Out), .N(N), .Z(Z), .V(V), .C(C));

// HI and LO Behavioral Registers	-----------------------------------------	
	always @(posedge clk, posedge rst)begin
		if (rst)
			{HI_Out, LO_Out} <= {64'H00000000};
		else if(HILO_Ld)
			{HI_Out, LO_Out} <= {Y_Hi_Out, Y_Low_Out};
		else
			{HI_Out, LO_Out} <= {HI_Out, LO_Out};
			
	end
// Y-MUX	--------------------------------------------------------------------		
	assign ALU_OUT = (Y_Sel == 3'H0) ? HI_Out:
						  (Y_Sel == 3'H1) ? LO_Out:			
						  (Y_Sel == 3'H2) ? Y_Low_Out:	
						  (Y_Sel == 3'H3) ? DY:			
						  (Y_Sel == 3'H4) ? PC_In:		
												  Y_Low_Out;
						  	
endmodule
