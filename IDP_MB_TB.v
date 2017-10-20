`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  TB_Integer_DataPath_2.v
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
module TB_Integer_Datapath_2;

	// Inputs
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
	//-----MEM---
   reg dm_cs; 
   reg dm_wr; 
   reg dm_rd; 
	reg D_In;
	reg DA_Sel;
	
	// Outputs
	wire C;
	wire V;
	wire N;
	wire Z;
	wire [31:0] ALU_OUT;
	wire [31:0] D_OUT;
	wire [31:0] D_Out_mem;
	
	
	// Testbench Specific
	reg address_sel;
	wire [31:0] Address;
	reg [31:0] Address_mem;

	
	// Memory Module Address Select
	assign Address = (address_sel) ? Address_mem : {20'b0, ALU_OUT[11:0]};
	
	// Instantiate the Unit Under Test (UUT)
	Interger_DataPath_2 uut (
		.clk(clk), 
		.rst(rst), 
		.S_Addr(S_Addr), 
		.D_Addr(D_Addr), 
		.T_Addr(T_Addr), 
		.D_En(D_En), 
		.DA_Sel(DA_Sel),
		.DT(DT), 
		.T_Sel(T_Sel), 
		.FS(FS), 
		.C(C), 
		.V(V), 
		.N(N), 
		.Z(Z), 
		.HILO_Ld(HILO_Ld), 
		.DY(D_Out_mem), 
		.PC_In(PC_In), 
		.Y_Sel(Y_Sel), 
		.ALU_OUT(ALU_OUT), 
		.D_OUT(D_OUT)
	);
	
	// Instantiate memory module
	Data_Memory uut1 (
    .clk(clk), 
    .Address(Address), 
    .D_In(D_OUT), 
    .dm_cs(dm_cs), 
    .dm_wr(dm_wr), 
    .dm_rd(dm_rd), 
    .D_Out(D_Out_mem)
    );
	always #5 clk = !clk;
	initial begin
		// PART 1. Register File Initialization
		/* Loading 32x32 registers with this initialization 
			file provided by Prof. Allison*/
		$readmemh("IntReg_Lab4.dat", uut.REG1.Register);
		$readmemh("dMem_Lab4.dat", uut1.Memory);
		$timeformat(-9, 1, "ns", 9);
		
		// Initialize Inputs
		// RESET ASSERTED
		clk = 0;
		rst = 1;
		S_Addr = 0;
		D_Addr = 0;
		T_Addr = 0;
		D_En = 0;
		DA_Sel = 0;
		DT = 0;
		T_Sel = 0;
		FS = 0;
		HILO_Ld = 0;
		DY = 0;
		PC_In = 0;
		Y_Sel = 0;
		dm_cs = 0; 
      dm_wr = 0; 
      dm_rd = 0;
		address_sel = 0;
		// Wait 100 ns for global reset to finish
		#100; rst = 1'b0;
        
		// Add stimulus here
		$display(" "); $display(" ");
		$display("**********************************************************");
		$display("    CECS 440: Integer_DataPath_2 Test                     ");
		$display("**********************************************************");
		$display(" "); $display(" ");
		
		/* PART 2. Reading and Displaying the Initial Contents 
			of the Register File
			
			Display the contents of the register file at initialization
			Register File - ALU FS=5'H00 for PASS_S which goes to Y_Lo
			which then needs to control the Y_Sel to input the value of 
			incoming Y_Lo at Y_Sel = 3'H2 in order for it to pass to ALU_OUT
		*/
		$display(" "); $display(" ");
		$display("*******************************************************");
		$display("         I N I T I A L   V A L U E S                   ");
		$display("*******************************************************");
		
		Reg_Dump();

// ******************  BEGINNING OF INSTRUCTIONS HERE:  ******************
		  
//	a)	$r1 <- $r3 | $r4 		
/* DESCRIPTION:
   Logical OR
   $r3, 0xA5A5_A5A5 -> 10100101101001011010010110100101
	$r4, 0x5A5A_5A5A -> 01011010010110100101101001011010
	------------------------------------------------------
	$r1<-0xFFFF_FFFF -> 11111111111111111111111111111111       	
*/
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h0,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h0,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};			 

//	b)	$r2 <- $r1 -$r14 		
/* DESCRIPTION:
   Logical OR
   $r1,  0x12345678 ->  0001 0010 0011 0100 0101 0110 0111 1111
	$r14, 0xFFFFFFF8 ->  1111 1111 1111 1111 1111 1111 1111 1000
	------------------------------------------------------------
	$r1<-000000007   ->	0000 0000 0000 0000 0000 0000 0000 0111			       
   	
*/ 

		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H02, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H2, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H2, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 

		 
//	c)	$r3 <- shr $r4	
/* DESCRIPTION:
   Shift Right Logical SRL - Result 2d2d2d2d	------------
   $r4,0x5A5A_5A5A -> 0101 1010 0101 1010 0101 1010 0101 1010                              
	------------------------------------------------------
	$r3<-0x2d2d2d2d->  0010 1101 0010 1101 0010 1101 0010 1101
*/

		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};			 

//	d)	$r4 <- shl $r5	
/* DESCRIPTION:
   Shift Left Logical SLL - Result 	48D159C0	------------
   $r5,0x2468_ACE0 -> ?00100100011010001010110011100000?
	------------------------------------------------------
	$r4<-0x48D1_59C0 ->?01001000110100010101100111000000?
*/		 

		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H04, 5'H00, 5'H05, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0C, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H04, 5'H00, 5'H05, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0C, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H04, 5'H00, 5'H05, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0C, 1'b0,  1'b0,  1'b0,  1'b0};			

//	e)	{$r6,$r5} <- $r15/$r14
/* DESCRIPTION:
   Division ($r6 <- HI, $r5 <- LO)- --------------------
   $r15,0x0000_75CC 
	$r14,0xFFFF_FFF8 
	------------------------------------------------------
	
*/		
  //-----------Modify $r6--------------
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};	
			
	//----------Modify $r5--------------
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H05, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H1,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};	
			
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

  //-----------Modify $r8--------------
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};	
			
	//----------Modify $r7--------------
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H07, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H1,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};

//	g)	$r12 <- 0xABCD_EF01
/* DESCRIPTION:
   Register Init $t12 with DY 	-----------------------
   $r12,0x0000_000C ->?00000000000000000000000000001100?
	------------------------------------------------------
	$r12<-0xABCD_EF01->??10101011110011011110111100000001??
*/
    //-------read $r12 <-- M[$r15]
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};	
		//--------DY input to write to $r12
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H3,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};	

//	h)	$r11 <- $r0 NOR $r11
/* DESCRIPTION:
   1's compliment of $r11			-----------------------
   $r0, 0x0000_0000 ->?00000000000000000000000000000000?
	$r11,0x0000_000B ->?00000000000000000000000000001011?
	------------------------------------------------------
	$r11<-0xFFFF_FFF4->??11111111111111111111111111110100??
*/ 		
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'H0B, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'H0B, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'H0B, 1'b0,  1'b0,  1'b0,  1'b0};				 

//	i)	$r10 <- $r0 - $r10
/* DESCRIPTION:
   2's compliment of $r11			-----------------------
   $r0, 0x0000_0000 ->?00000000000000000000000000000000?
	
	------------------------------------------------------
	$r10<-0x0000_000B<-?00000000000000000000000000001011?
*/			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'HA, 5'H00, 5'H0A, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'HA, 5'H00, 5'H0A, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'HA, 5'H00, 5'H0A, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 
		
//	j)	$r9 <- $r10 + $r11
/* DESCRIPTION:
   ADD (signed)	result, 	FFFFFFFF	---------------------
   $r10,0x0000_000B ->?00000000000000000000000000001011?
	$r11,0xFFFF_FFF4 ->?11111111111111111111111111110100?
	------------------------------------------------------
	$r9 <-0xFFFF_FFFF<-?11111111111111111111111111111111?
*/

		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H09, 5'H0A, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H09, 5'H0A, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H09, 5'H0A, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};			 

//	k)	$r13 <- 0x1001_00C0 (PC_In)
/* DESCRIPTION:
   PASS using PC_In	-----------------------------------
   $r13,0x0000_000D ->?00000000000000000000000000001101?
	------------------------------------------------------
	$r13<-0x1001_00C0<-?00010000000000010000000011000000?
*/

		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0D, 5'H00, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H4,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0D, 5'H00, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H4,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b1,  5'H0D, 5'H00, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H4,  5'H02, 1'b0,  1'b0,  1'b0,  1'b0};

//l) 		 M[$r14] <- $r12  Store to memory ( @0xFF8)
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H00, 5'H0E, 5'H0C, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b1,  1'b0,  1'b0};
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H00, 5'H0E, 5'H0C, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b1,  1'b0,  1'b0};			 
		@(negedge clk)
			{D_En, D_Addr, S_Addr, T_Addr, DT, PC_In, 
			 T_Sel, Y_Sel, FS, dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  5'H00, 5'H0E, 5'H0C, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b1,  1'b0,  1'b0};
		
		@(negedge clk) 		  
		
		$display(" "); $display(" ");
		$display("*******************************************************");
		$display("           F I N A L   V A L U E S                     ");
		$display("*******************************************************");
		
		
		Reg_Dump();
		$display(" "); $display(" ");
		$display("*******************************************************");
		$display("      M E M O R Y   W R I T E   V A L U E S            ");
		$display("*******************************************************");
		
		@(negedge clk)
		{dm_cs, dm_wr, dm_rd} = 3'b101;
		address_sel           = 1'b1;
		Address_mem           = 32'h0000_0FF8;
		
		@(posedge clk)
		$display("t=%t  Address=%h  D_Out=%h", $time, Address_mem, D_Out_mem);
		$finish;
	end
// ******************  Reg_Dump Task:  ******************		
	task Reg_Dump();
	integer i;
	begin
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			T_Addr = i;
			{D_En, D_Addr, S_Addr, T_Addr} = 
			{1'b0,  5'H00, 5'H00,  i};
			{DT, PC_In} = 
			{32'HFFFF_FFFB, 32'H1001_00C0};
			{T_Sel, Y_Sel, FS} = 
			{1'b1,  3'h0,  5'h01};
			{dm_cs, dm_wr, dm_rd, HILO_Ld} = 
			{1'b0,  1'b0,  1'b0,  1'b0};
			@(posedge clk)
			#1$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, T_Addr, uut.REG1.T);
		end
	end
	endtask	
endmodule

