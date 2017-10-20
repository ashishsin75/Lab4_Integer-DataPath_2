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
	reg CLK;
	reg RST;
	reg [4:0] S_ADDR;
	reg [4:0] D_ADDR;
	reg [4:0] T_ADDR;
	reg D_EN;
	reg [31:0] DT;
	reg        T_SEL;
	reg [31:0] PC_IN;
	reg [2:0] Y_Sel;
	reg [4:0] FS;
	reg HILO_Ld;
	//-----MEM---
	reg DM_CS;
	reg DM_WR;
	reg DM_RD;
	reg D_In; 
   reg dm_cs; 
   reg dm_wr; 
   reg dm_rd; 

	// Outputs
	wire C;
	wire V;
	wire N;
	wire Z;
	wire [31:0] ALU_OUT;
	wire [31:0] D_Out;
	wire [31:0] D_Out_mem;
	
	// Testbench Specific
	reg address_sel;
	wire [31:0] Address;
	reg [31:0] Address_mem;
	
	
	// Memory Module Address Select
	assign Address = (address_sel) ? Address_mem : {20'b0, ALU_OUT[11:0]};
	
	// Instantiate the Unit Under Test (UUT)
	Interger_DataPath_2 uut (
		.CLK(CLK), 
		.RST(RST),
		.D_ADDR(D_ADDR),
		.S_ADDR(S_ADDR), 
		.T_ADDR(T_ADDR),
		.D_EN(D_EN), 	
		.DT(DT), 
		.T_SEL(T_SEL),
		.FS(FS),
		.C(C), 
		.V(V), 
		.N(N), 
		.Z(Z), 
		.HILO_LD(HILO_LD),
		.DY(D_Out_mem),		
		.PC_In(PC_IN),
		.Y_Sel(Y_SEL),
		.ALU_OUT(ALU_OUT), 
		.D_OUT(D_Out)
				
	);
	
	// Instantiate memory module
	Data_Memory uut1 (
    .clk(CLK), 
    .Address(Address), 
    .D_In(D_Out), 
    .dm_cs(dm_cs), 
    .dm_wr(dm_wr), 
    .dm_rd(dm_rd), 
    .D_Out(D_Out_mem)
    );
	always #5 CLK = !CLK;
	initial begin
		// PART 1. Register File Initialization
		/* Loading 32x32 registers with this initialization 
			file provided by Prof. Allison*/
		$readmemh("IntReg_Lab4.dat", uut.REG0.Register);
		$readmemh("dMem_Lab4.dat", uut1.Memory);
		$timeformat(-9, 1, "ns", 9);
		
		// Initialize Inputs
		// RESET ASSERTED
		CLK = 0;
		RST = 1;
		S_ADDR = 0;
		D_ADDR = 0;
		T_ADDR = 0;
		D_EN = 0;
		DT = 0;
		T_SEL = 0;
		PC_IN = 0;
		Y_SEL = 0;
		FS = 0;
		HILO_LD = 0;
		DM_CS = 0;
		DM_WR = 0;
		DM_RD = 0;
		address_sel = 0;
		// Wait 100 ns for global reset to finish
		#100; RST = 1'b0;
        
		// Add stimulus here
		$display(" "); $display(" ");
		$display("**********************************************************");
		$display("************** CECS 440: Integer_DataPath_2 Test" +
					"****************");
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
		$display("***** CONTENTS AT INITIALIZATION *****");
		$display(" "); $display(" ");
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
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h0,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h0,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H01, 5'H03, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'h09, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(posedge CLK)
			T_ADDR = 1;
			$display(" ");
			$display("first instruction $r1 <- $r3 | $r4 ");
			$display (" ");
		  #1$display("t=%t: @Loc S_Addr=%h <- S=%h", $time, T_ADDR, uut.REG0.T);
 
//	b)	$r2 <- $r1 -$r14 		
/* DESCRIPTION:
   Logical OR
   $r1,  0x12345678 ->  0001 0010 0011 0100 0101 0110 0111 1111
	$r14, 0xFFFFFFF8 ->  1111 1111 1111 1111 1111 1111 1111 1000
	------------------------------------------------------------
	$r1<-000000007   ->	0000 0000 0000 0000 0000 0000 0000 0111			       
   	
*/ 

		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H02, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H2, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H2, 5'H01, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H05, 1'b0,  1'b0,  1'b0,  1'b0};			 

		 
//	c)	$r3 <- shr $r4	
/* DESCRIPTION:
   Shift Right Logical SRL - Result 2d2d2d2d	------------
   $r4,0x5A5A_5A5A -> 0101 1010 0101 1010 0101 1010 0101 1010                              
	------------------------------------------------------
	$r3<-0x2d2d2d2d->  0010 1101 0010 1101 0010 1101 0010 1101
*/

		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H03, 5'H00, 5'H04, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0D, 1'b0,  1'b0,  1'b0,  1'b0};			 

//	d)	$r4 <- shl $r5	
/* DESCRIPTION:
   Shift Left Logical SLL - Result 	48D159C0	------------
   $r5,0x2468_ACE0 -> ?00100100011010001010110011100000?
	------------------------------------------------------
	$r4<-0x48D1_59C0 ->?01001000110100010101100111000000?
*/		 

		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H04, 5'H00, 5'H05, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0C, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H04, 5'H00, 5'H05, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H0C, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
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
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H06, 5'H0F, 5'H0E, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H0,  5'H1F, 1'b0,  1'b0,  1'b0,  1'b1};	
			
	//----------Modify $r5--------------
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
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
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H08, 5'H0B, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b0,  3'H0,  5'H1E, 1'b0,  1'b0,  1'b0,  1'b1};	
			
	//----------Modify $r7--------------
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
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
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H0C, 5'H0F, 5'H00, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'H2,  5'H00, 1'b1,  1'b0,  1'b1,  1'b0};	
		//--------DY input to write to $r12
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
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
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'h0B, 1'b0,  1'b0,  1'b0,  1'b0};
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'h0B, 1'b0,  1'b0,  1'b0,  1'b0};			 
		@(negedge CLK)
			{D_EN, D_ADDR, S_ADDR, T_ADDR, DT, PC_IN, 
			 T_SEL, Y_SEL, FS, DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b1,  5'H0B, 5'H00, 5'H0B, 32'HFFFF_FFFB, 32'H1001_00C0, 
			 1'b1,  3'h2,  5'h0B, 1'b0,  1'b0,  1'b0,  1'b0};				 
			 
			 
		 @(negedge CLK) 		  
		Reg_Dump();

	end
// ******************  Reg_Dump Task:  ******************		
	task Reg_Dump();
	integer i;
	begin
		for(i=0; i<=15; i=i+1)begin
			@(negedge CLK)
			T_ADDR = i;
			{D_EN, D_ADDR, S_ADDR, T_ADDR} = 
			{1'b0,  5'H00, 5'H00,  i};
			{DT, PC_IN} = 
			{32'HFFFF_FFFB, 32'H1001_00C0};
			{T_SEL, Y_SEL, FS} = 
			{1'b1,  3'h0,  5'h01};
			{DM_CS, DM_WR, DM_RD, HILO_LD} = 
			{1'b0,  1'b0,  1'b0,  1'b0};
			@(posedge CLK)
			#1$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, T_ADDR, uut.REG0.T);
		end
	end
	endtask	
endmodule

