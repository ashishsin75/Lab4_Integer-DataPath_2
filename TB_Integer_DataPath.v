`timescale 1ns / 1ps

/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  TB_Integer_DataPath.v
 * Project:    Lab_Assignment_3
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/22/2017 
 *
 * Purpose:		
 *
 * Notes:		
 *
 ****************************************************************************/

module TB_Integer_DataPath;

	// Inputs
	reg clk;
	reg rst;
	reg [4:0] S_Addr;
	reg [4:0] D_Addr;
	reg [4:0] T_Addr;
	reg D_En;
	reg [31:0] DT;
	reg T_Sel;
	reg [4:0] FS;
	reg HILO_Ld;
	reg [31:0] DY;
	reg [31:0] PC_In;
	reg [2:0] Y_Sel;

	// Outputs
	wire C;
	wire V;
	wire N;
	wire Z;
	wire [31:0] ALU_OUT;
	wire [31:0] D_OUT;
	//integer i;
	// Instantiate the Unit Under Test (UUT)
	Interger_DataPath uut (
		.clk(clk), 
		.rst(rst), 
		.S_Addr(S_Addr), 
		.D_Addr(D_Addr), 
		.T_Addr(T_Addr), 
		.D_En(D_En), 
		.DT(DT), 
		.T_Sel(T_Sel), 
		.FS(FS), 
		.C(C), 
		.V(V), 
		.N(N), 
		.Z(Z), 
		.HILO_Ld(HILO_Ld), 
		.DY(DY), 
		.PC_In(PC_In), 
		.Y_Sel(Y_Sel), 
		.ALU_OUT(ALU_OUT), 
		.D_OUT(D_OUT)
	);
	always #5 clk = !clk;

	initial begin
		// PART 1. Register File Initialization
		/* Loading 32x32 registers with this initialization 
			file provided by Prof. Allison*/
		$readmemh("IntReg_Lab3.dat", uut.REG0.Register);
		
		$timeformat(-9, 1, "ns", 9);
		
		// Initialize Inputs
		// RESET ASSERTED
		clk = 0;
		rst = 1;
		S_Addr = 0;
		D_Addr = 0;
		T_Addr = 0;
		D_En = 0;
		DT = 0;
		T_Sel = 0;
		FS = 0;
		HILO_Ld = 0;
		DY = 0;
		PC_In = 0;
		Y_Sel = 0;

		// Wait 100 ns for global reset to finish
		#100; rst = 1'b0;
        
		// Add stimulus here
		$display(" "); $display(" ");
		$display("**********************************************************");
		$display("************** CECS 440: Integer_DataPath Test" +
					"****************");
		$display("**********************************************************");
		$display(" "); $display(" ");

		/* PART 2. Reading and Displaying the Initial Contents 
			of the Register File
			
			Display the contents of the register file at initialization
			Register File - ALU FS=5'H00 for PASS_S which goes to Y_Lo
			which then needs to control the Y_Sel to input the value of 
			incoming Y_Lo at Y_Sel = 3'H2 in order for it to pass to ALU_OUT*/
		$display(" "); $display(" ");
		$display("***** CONTENTS AT INITIALIZATION *****");
		$display(" "); $display(" ");
		Reg_Dump();
		
		/*Troubleshooting this one is working! 
		  Before continuing on to the rest*/
		  
// ******************  BEGINNING OF INSTRUCTIONS HERE:  ******************
		  
//	a)	$r1 <- $r3 | $r4 		
/* DESCRIPTION:
   Logical OR - Result FFFFFFFF	------------------------ 
   $r3, 0xA5A5_A5A5 -> 10100101101001011010010110100101
	$r4, 0x5A5A_5A5A -> 01011010010110100101101001011010
	------------------------------------------------------
	$r1<-0xFFFF_FFFF -> 11111111111111111111111111111111                              
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H01, 5'H03, 5'H04};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H09, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};
		
		
		
//	b)	$r2 <- $r1 - $r14	
/* DESCRIPTION:
   SUB - Result 00000007	------------------------------ 
   $r1, 0xFFFF_FFFF -> 11111111111111111111111111111111                              
	$r14,0xFFFF_FFF8 -> 11111111111111111111111111111100
	------------------------------------------------------
	$r2<-0x0000_0007 -> 00000000000000000000000000000111                              
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H02, 5'H01, 5'H0E};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H04, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	c)	$r3 <- shr $r14	
/* DESCRIPTION:
   Shift Right Logical SRL - Result 7ffffffc	------------
   $r14,0xFFFF_FFF8 -> 11111111111111111111111111111000                              
	------------------------------------------------------
	$r3<-0x7ffffffc->   ?01111111111111111111111111111100?
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H03, 5'H00, 5'H0E};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H0D, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	d)	$r4 <- shl $r5	
/* DESCRIPTION:
   Shift Left Logical SLL - Result 	48D159C0	------------
   $r5,0x2468_ACE0 -> ?00100100011010001010110011100000?
	------------------------------------------------------
	$r4<-0x48D1_59C0 ->?01001000110100010101100111000000?
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H04, 5'H00, 5'H05};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H0C, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	e)	{$r6,$r5} <- $r15/$r14
/* DESCRIPTION:
   Division ($r6 <- HI, $r5 <- LO)- --------------------
   $r15,0x0000_75CC 
	$r14,0xFFFF_FFF8 
	------------------------------------------------------
	
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b0,  5'H06, 5'H0F, 5'H0E};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b1, 1'b1, 32'HFFFF_FFFFB, 5'H1F, 3'H0, 32'HABCD_EF01, 32'H1001_00C0};
//		#1$display("Y_Low: Val=%h", ALU_OUT);
//		$display("Ld=%h",uut.HILO_Ld);
//		$display("Hi=%h  Low=%h",uut.Y_Hi_Out,uut.Y_Low_Out);
//		$display("Hi=%h  Low=%h",uut.HI_Out,uut.LO_Out);
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H06, 5'H0F, 5'H0E};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H1F, 3'H0, 32'HABCD_EF01, 32'H1001_00C0};		
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H05, 5'H0F, 5'H0E};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H1F, 3'H1, 32'HABCD_EF01, 32'H1001_00C0};



//	f)	{$r8, $r7} <- $r11 * 0xFFFF_FFFB(DT)
/* DESCRIPTION:
   MUL $r11 with DT, Result is ?AFFFFFFC9?	---------------
	($r8<-HI, $r7<-LO)
   $r11,0x0000_000B <- 00000000000000000000000000001011
	DT,  0xFFFF_FFFB <-?11111111111111111111111111111011?
	------------------------------------------------------
	$r8<-0x0000_000A ->00000000000000000000000000001010
	$r7<-0xFFFF_FFC9 ->11111111111111111111111111001001?
	$r8<-0x0000000A		$r7<-FFFF_FFC9
	1010						11111111111111111111111111001001
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b0,  5'H08, 5'H0B, 5'H00};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b1, 1'b0, 32'HFFFF_FFFFB, 5'H1E, 3'H0, 32'HABCD_EF01, 32'H1001_00C0};
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H08, 5'H0B, 5'H00};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b0, 32'HFFFF_FFFFB, 5'H1E, 3'H0, 32'HABCD_EF01, 32'H1001_00C0};
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H07, 5'H0B, 5'H00};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b0, 32'HFFFF_FFFFB, 5'H1E, 3'H1, 32'HABCD_EF01, 32'H1001_00C0};


//	g)	$r12 <- 0xABCD_EF01
/* DESCRIPTION:
   Register Init $t12 with DY 	-----------------------
   $r12,0x0000_000C ->?00000000000000000000000000001100?
	------------------------------------------------------
	$r12<-0xABCD_EF01->??10101011110011011110111100000001??
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H0C, 5'H00, 5'H00};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H00, 3'H3, 32'HABCD_EF01, 32'H1001_00C0};



//	h)	$r11 <- $r0 NOR $r11
/* DESCRIPTION:
   1's compliment of $r11			-----------------------
   $r0, 0x0000_0000 ->?00000000000000000000000000000000?
	$r11,0x0000_000B ->?00000000000000000000000000001011?
	------------------------------------------------------
	$r11<-0xFFFF_FFF4->??11111111111111111111111111110100??
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H0B, 5'H00, 5'H0B};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H0B, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	i)	$r10 <- $r0 - $r11
/* DESCRIPTION:
   2's compliment of $r11			-----------------------
   $r0, 0x0000_0000 ->?00000000000000000000000000000000?
	$r11,0xFFFF_FFF4 ->??11111111111111111111111111110100??
	------------------------------------------------------
	$r10<-0x0000_000B<-?00000000000000000000000000001011?
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H0A, 5'H00, 5'H0B};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H0B, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	j)	$r9 <- $r10 + $r11
/* DESCRIPTION:
   ADD (signed)	result, 	FFFFFFFF	---------------------
   $r10,0x0000_000B ->?00000000000000000000000000001011?
	$r11,0xFFFF_FFF4 ->?11111111111111111111111111110100?
	------------------------------------------------------
	$r9 <-0xFFFF_FFFF<-?11111111111111111111111111111111?
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H09, 5'H0A, 5'H0B};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H02, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};



//	k)	$r13 <- 0x1001_00C0 (PC_In)
/* DESCRIPTION:
   PASS using PC_In	-----------------------------------
   $r13,0x0000_000D ->?00000000000000000000000000001101?
	------------------------------------------------------
	$r13<-0x1001_00C0<-?00010000000000010000000011000000?
*/
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H0D, 5'H00, 5'H00};
		{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
		{1'b0, 1'b1, 32'HFFFF_FFFFB, 5'H02, 3'H4, 32'HABCD_EF01, 32'H1001_00C0};
// ******************  END OF INSTRUCTIONS HERE:  ******************		
		$display(" "); $display(" ");
		$display("***** CONTENTS AFTER INSTRUCTIONS PERFORMED *****");
		$display(" "); $display(" ");
		Reg_Dump();		
		$finish;
	end
      
// ******************  Reg_Dump Task:  ******************		
	task Reg_Dump();
	integer i;
	begin
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr} = {1'b0,  5'H00, i, 5'H00};
			{HILO_Ld, T_Sel, DT, FS, Y_Sel, DY, PC_In} = 
			{1'b0, 1'b0, 32'HFFFF_FFFFB, 5'H00, 3'H2, 32'HABCD_EF01, 32'H1001_00C0};
			S_Addr = i; 
			@(posedge clk)
			#1$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, S_Addr, ALU_OUT);
		end
	end
	endtask
	
	
endmodule













