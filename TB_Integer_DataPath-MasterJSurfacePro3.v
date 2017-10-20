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
	integer i;
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
		// Loading 32x32 registers with this initialization file provided by Prof. Allison
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
		$display("************** CECS 440: Integer_DataPath Test ****************");
		$display("**********************************************************");
		$display(" "); $display(" ");
		
		// PART 2. Reading and Displaying the Initial Contents of the Register File
		// Display the contents of the register file at initialization
		/* Register File - ALU FS=5'H00 for PASS_S which goes to Y_Lo
			which then needs to control the Y_Sel to input the value of 
			incoming Y_Lo at Y_Sel = 3'H2 in orde for it to pass to ALU_OUT*/
		$display("***** CONTENTS AT INITIALIZATION *****");
		//Reg_Dump(D_EnT, D_AddrT, S_AddrT, T_AddrT, HILO_LdT, T_SelT, FST, Y_SelT);
//		@(negedge clk)
//		Reg_Dump(1'B0, 5'H01, 5'H03, 5'H04, 1'B0, 1'B1, 5'H09, 3'H2);
		Reg_Dump();
//		for(i=0; i<=15; i=i+1)begin
//			@(negedge clk)
//			{FS, Y_Sel}= {5'H00, 3'H2};
//			S_Addr = i; T_Addr = i;
//			@(posedge clk)
//			$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, S_Addr, ALU_OUT);
//		end
		
		//Troubleshooting this one is working!
	
//	$r1 <- $r3 | $r4 		;Logical OR - Result FFFFFFFF	------------------------ 
		@(negedge clk)
		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H01, 5'H03, 5'H04};
		{HILO_Ld, T_Sel, FS, Y_Sel} = {1'b0, 1'b1, 5'H09, 3'H2};
		@(posedge clk)
		#1$display("New Value of $r1 @Loc=%h <- Value=%h", D_Addr, ALU_OUT);
//	$r2 <- $r1 - $r14 	;Logical OR - Result FFFFFFFF	------------------------- -1 - -7
//		@(posedge clk)
//		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H02, 5'H01, 5'H14};
//		{HILO_Ld, T_Sel, FS, Y_Sel} = {1'b0, 1'b1, 5'H04, 3'H2};
//		@(negedge clk)
//		#1$display("New Value of $r2 @Loc=%h <- Value=%h", D_Addr, ALU_OUT);
////	$r3 <- shr $r14 	;Logical Shift Right					------------------------- -1 - -7
//		@(posedge clk)
//		{D_En, D_Addr, S_Addr, T_Addr} = {1'b1,  5'H03, 5'H00, 5'H14};
//		{HILO_Ld, T_Sel, FS, Y_Sel} = {1'b0, 1'b1, 5'H0D, 3'H2};
//		@(negedge clk)#1
//		$display("New Value of $r3 @Loc=%h <- Value=%h", D_Addr, ALU_OUT);
		Reg_Dump();		
		$finish;
	end
      
	


//	Reg_Dump Task`----------------------------------------------------------------------------	
	task Reg_Dump();
	begin
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			{FS, Y_Sel}= {5'H00, 3'H2};
			S_Addr = i; //T_Addr = i+16;
			@(posedge clk)
			#1$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, S_Addr, ALU_OUT);
		end
	end
	endtask	
endmodule













