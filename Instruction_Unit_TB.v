`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:11 10/11/2017
// Design Name:   Instruction_Unit
// Module Name:   C:/Users/ashis/Dropbox/Computer Engineering CSULB/CECS440/LAB 5 Ashish & J/Lab4_Integer DataPath_2/Instruction_Unit_TB.v
// Project Name:  Lab1_32_Bit_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instruction_Unit_TB;
	// Inputs
	// Inputs
	reg clk;
	reg rst;
	reg pc_ld;
	reg pc_inc;
	reg im_cs;
	reg im_wr;
	reg im_rd;
	reg ir_ld;
	reg [31:0] PC_In;
	reg [31:0] D_In;
	
	// Outputs
	wire [31:0] PC_out;
	wire [31:0] IR_out;
	wire [31:0] SE_16;
	wire C;
	wire V;
	wire N;
	wire Z;
	
	// Internal connections
	//reg [4:0] S_Addr;
	//reg [4:0] D_Addr;
	reg [4:0] T_Addr;
	reg D_En;
	reg [31:0] DT;
	reg T_Sel;
	reg [4:0] FS;
	reg HILO_Ld;
	reg [31:0] DY;
	
	reg [2:0] Y_Sel;
	//-----MEM---
   reg dm_cs; 
   reg dm_wr; 
   reg dm_rd; 
	reg DA_Sel;
	

	wire [31:0] ALU_OUT;
	wire [31:0] D_Out_mem;
	
	
	// Testbench Specific
	reg address_sel;
	reg [31:0] Address_mem;
	reg T_in_sel;
	reg FS_sel;
	wire [31:0] Address;
	wire [4:0] FS_in;
	wire [4:0] T_in;
	wire [31:0] IDP_D_OUT;
	
	// Allow testbench to control these inputs for display purposes
	assign FS_in = (FS_sel) 		 ? FS : {20'b0,IR_out[31:27]};
	assign T_in  = (T_in_sel)      ? T_Addr  : IR_out[20:16];
	assign Address = (address_sel) ? Address_mem : {20'b0, ALU_OUT[11:0]};
	
	
	// Memory Module Address Select
	// Instantiate the Unit Under Test (UUT)
	// Instruction Unit
	Instruction_Unit InstructUnit(
		.clk(clk), 
		.rst(rst), 
		.pc_ld(pc_ld), 
		.pc_inc(pc_inc), 
		.im_cs(im_cs), 
		.im_wr(im_wr), 
		.im_rd(im_rd), 
		.ir_ld(ir_ld), 
		.PC_in(ALU_OUT), 
		.D_In(D_In), 
		.PC_out(PC_out), 
		.IR_out(IR_out), 
		.SE_16(SE_16)
	);
	
	// Instantiate the Unit Under Test (UUT)
	Interger_DataPath_2 IDP1(
		.clk(clk), 
		.rst(rst), 
		.S_Addr(IR_out[25:21]), 
		.D_Addr(IR_out[15:11]), 
		.T_Addr(T_in), 
		.D_En(D_En), 
		.DA_Sel(DA_Sel),
		.DT(SE_16), 
		.T_Sel(T_Sel), 
		.FS(FS_in),	 
		.C(C), 
		.V(V), 
		.N(N), 
		.Z(Z), 
		.HILO_Ld(HILO_Ld), 
		.DY(D_Out_mem), 
		.PC_In(PC_out), 
		.Y_Sel(Y_Sel), 
		.ALU_OUT(ALU_OUT), 
		.D_OUT(IDP_D_OUT)
	);
	
	// Instantiate memory module
	Data_Memory DatMem(
    .clk(clk), 
    .Address(Address), 
    .D_In(IDP_D_OUT), 
    .dm_cs(dm_cs), 
    .dm_wr(dm_wr), 
    .dm_rd(dm_rd), 
    .D_Out(D_Out_mem)
    );
	 
	always
	#5	clk = ~clk;


   initial begin
		$readmemb("iMem_Lab5.dat", InstructUnit.IM0.imem);
		$readmemh("IntReg_Lab5.dat", IDP1.REG1.Register);
		$readmemh("dMem_Lab5.dat", DatMem.Memory);
		$timeformat(-9, 1, " ns", 9);
		
		// Initialize Inputs
		// RESET ASSERTED
		clk = 0;
		rst = 1;
		pc_ld = 0;
		pc_inc = 0;
		im_cs = 0;
		im_wr = 0;
		im_rd = 0;
		ir_ld = 0;
		D_En = 0;
		DA_Sel = 0;
		T_Sel = 0;
		HILO_Ld = 0;
		Y_Sel = 0;
		dm_cs = 0; 
      dm_wr = 0; 
      dm_rd = 0;
		
		FS_sel = 0;
		T_in_sel = 0;
		address_sel = 0;
		// Wait 100 ns for global reset to finish
		#100; 
		rst = 0;
		#10;
		
		$display(" "); $display(" ");
		$display("***************************************************************");
		$display("              C E C S    4 4 0    L A B 5                      ");
		$display("***************************************************************");
		$display(" ");
		$display(" ");
        
		$display("***************************************************************");
		$display("      I N I T I A L    R E G I S T E R    V A L U E S          ");
		$display("***************************************************************");
		
	// Output initial register values
		Reg_Dump;
		
	// ******************  BEGINNING OF INSTRUCTIONS HERE:  ******************
		  
		/* $r1 = $r3 | $r4 (Logical Or) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r3, RT <- $r4
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r3) | RT(r4)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r1 <- ALU_Out(r3 | r4)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
	
		/* $r2 = $r1 - $r14 (Signed Subtraction) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r1, RT <- $r14
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r1) | RT(r14)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r2 <- ALU_Out(r1 | r14)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;


		/* $r3 = SHR $r4 (Logical Shift Right) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RT <- $r4
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RT(r4) >> 1
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r3 <- ALU_Out(r4 >> 1)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		

		/* $r4 = SHL $r5 (Logical Shift Left) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RT <- $r5
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RT(r5) >> 1
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r4 <- ALU_Out(r5 >> 1)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		


		/* {$r6,$r5} = $r15 / $r14 (Division) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r15, RT <- $r14
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: HILO <- RS(r15) / RT(r14)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_1_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: IR <- iM[PC], PC <- PC + 4  // gets $rd for $r6
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop5: $r6 <- HI
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop6: IR <- iM[PC], PC <- PC + 4  // gets $rd for $r5
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop7: $r5 <- LO
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_001;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
	
	
	
	
		/* {$r8,$r7} = $r11 * 0xFFFF_FFFB (Multiply Using DT) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r11, RT <- DT(0xFFFF_FFFB)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_0_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: HILO <- RS($r11) * RS(0xFFFF_FFFB)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_1_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: IR <- iM[PC], PC <- PC + 4  // gets $rd for $r6
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop5: $r8 <- HI
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop6: IR <- iM[PC], PC <- PC + 4  // gets $rd for $r5
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop7: $r7 <- LO
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_001;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
	
		
		
		/* $r12 = M[$r15 + 0] */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_0_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- [$r15], RT <- $r12
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r15+0)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_1_0_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: D_in <- M[r15]
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b1_1_0;
		
		// uop5: $r12 <- M[r15]
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_1_1_0_011;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		
	
		/* $r11 = $r0 NOR $r11 (One's Complement) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r0, RT <- $r11
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r0) NOR RT(r11)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r11 <- ALU_Out(r0 NOR r11)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		
		
		/* $r10 = $r0 - $r10 (Two's Complement) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r0, RT <- $r10
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r0) | RT(r10)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r10 <- ALU_Out(r0 - r10)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		
		/* $r9 = $r10 + $r11 (Signed Addition) */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_0_0_000;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r10, RT <- $r11
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r10) + RT(r11)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: $r9 <- ALU_Out(r10 + r11)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b1_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		
		
		/* M[$r14+0] = $r12  */
		// uop1: IR <- iM[PC], PC + 4 
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_1_1_1_1_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop2: RS <- $r14, RT <- $r12
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop3: ALU_Out <- RS(r14)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
		
		// uop4: M[ALU_OUT(r14)] <- D_OUT(r12)
		@(negedge clk)
		// Instruction Unit Control
		{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
		// Datapath Control 
		{D_En, DA_Sel, T_Sel, HILO_Ld, Y_Sel} = 7'b0_0_1_0_010;
		// Data Memory Control
		{dm_cs, dm_rd, dm_wr} = 3'b1_0_1;
		
		//*********************END OF uOperations********************
		$display(" ");
		$display(" ");
        
		$display("***************************************************************");
		$display("       F I N A L    R E G I S T E R    V A L U E S             ");
		$display("***************************************************************");
		
		Reg_Dump;
		
		$display(" "); $display(" ");
		$display("**********************************************************************");
		$display("           M E M O R Y   W R I T E   V A L U E S                      ");
		$display("**********************************************************************");
		
		@(negedge clk)
		{dm_cs, dm_wr, dm_rd} = 3'b101;
		address_sel           = 1'b1;
		Address_mem           = 32'h0000_0FF8;
		
		@(posedge clk)
		$display("t=%t  Address=%h  D_Out=%h", $time, Address_mem, D_Out_mem);
		$finish;		
	
	end
      	
			// Displays registers r0-r15
	
	task Reg_Dump;
	integer i;
		begin
			@(negedge clk)
			// Instruction Unit Control
			{pc_ld, pc_inc, ir_ld, im_cs, im_rd, im_wr} = 6'b0_0_0_0_0_0;
			// Datapath Control 
			{D_En,  T_Sel, HILO_Ld, Y_Sel} = 7'b0_1_0_010;
			// Data Memory Control
			{dm_cs, dm_rd, dm_wr} = 3'b0_0_0;
			FS_sel = 1;
			T_in_sel = 1;
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			T_Addr = i;
			FS = 5'h01;
			//	@(negedge clk)
			//	@(negedge clk) 
				@(posedge clk)
			#1$display("t=%t: $r%0d @Loc S_Addr=%h <- S=%h", $time, i, T_Addr, IDP1.REG1.T);
			//$display("t=%t  T_Addr=%h  ALU_Out=%h", $time, T_Addr, ALU_OUT);

		end
		
			// Reset opcode sel and T sel back to 0 
			FS_sel = 0;
		   T_in_sel = 0;
		end
	endtask
		
endmodule

