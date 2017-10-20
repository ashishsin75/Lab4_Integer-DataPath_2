`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  TB_RegFile32.v
 * Project:    Lab_Assignment_2
 * Designer:   J Jesus Perez Gonzalez
 * Email:      PerezGonzalez.JJesus@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  9/19/2017 
 *
 * Purpose:		The purpose of the Verilog Test Fixture is to test the 
 *					functionlaioty of the behavioral RegFile32 which is a register
 *					file of 32 register each of 32-bits. This test fixture is
 *					broken into 3 major sections: 
 *					1) Displaying the contents of all 32 registers @ initialization
 *					which was initialized by the $readmemh, file name 
 *					IntReg_Lab2.dat found in root directory of this project. 
 *					2) Write to every register including register $r0
 *					3) Read the final register file with the newly written data 
 *					in order to verify if overwritten and if $r0 remains 32'H0
 *					
 * Notes:		1)	$r0 - $r15, displayed by addressing S port
 *						$r16 - $r31, dusplayed by addressing T port
 *					3) $r0 - $r15, displayed by addressing S port
 *						$r16 - $r31, dusplayed by addressing T port
 ****************************************************************************/

module TB_RegFile32;

	// Inputs
	reg D_En;
	reg [31:0] D;
	reg [4:0] D_Addr;
	reg [4:0] S_Addr;
	reg [4:0] T_Addr;
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] S;
	wire [31:0] T;
	integer i;
	// Instantiate the Unit Under Test (UUT)
	RegFile32 uut (
		.D_En(D_En), 
		.D(D), 
		.S(S), 
		.T(T), 
		.D_Addr(D_Addr), 
		.S_Addr(S_Addr), 
		.T_Addr(T_Addr), 
		.clk(clk), 
		.rst(rst)
	);
	always
		#5clk = !clk;
	initial begin
	
		// Load the data file for initial register file contents
		$readmemh("IntReg_Lab2.dat", uut.Register);
		$timeformat(-9, 1, "ns", 9);
	
		// Initialize Inputs
		// RESET ASSERTED
		D_En = 0;
		D = 32'H0;
		D_Addr = 5'H00;
		S_Addr = 5'H00;
		T_Addr = 5'H00;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100 rst = 1'b0;
    
		// Add stimulus here
		$display(" "); $display(" ");
		$display("**********************************************************");
		$display("************** CECS 440: RegFile32 Test **********************");
		$display("**********************************************************");
		$display(" "); $display(" ");
		
		// Display the contents of the register file at initialization
		$display("***** CONTENTS AT INITIALIZATION *****");
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			S_Addr = i; T_Addr = i+16;
			@(posedge clk)
			$display("t=%t:  $r%0d @Loc S_Addr=%h,  S=%h ||",
						$time, i, S_Addr, S, 
						"$r%0d @Loc T_Addr=%h,  T=%h", 
						i+16, T_Addr, T);
			
		end
		
		// Rewrite to every register and attempt to write to Register[0] , 
		// However it should not be allowerd, which is why it is being done, 
		// To verify. 
		$display(" "); $display(" ");
		$display("***** WRITING TO EVERY REGISTER INCLUDING ATTEMPT TO $R0 *****");
		D_En = 1'b1; //#10;
		for(i=0; i<=31; i=i+1)begin
			@(negedge clk)
			D_Addr = i;
			D = ((~i)<<8) + (-65536*i) + i;
			@(posedge clk)
			$display("t=%t:  D_En=%h,  $r%0d @Loc D_Addr=%h <- Data: D=%h", 
						$time, D_En, i, D_Addr, D);
		end
		
		// Display the ending finalized contents of the register file
		$display(" "); $display(" ");
		$display("***** FINAL CONTENTS *****");
		for(i=0; i<=15; i=i+1)begin
			@(negedge clk)
			S_Addr = i; T_Addr = i+16;
			@(posedge clk)
			$display("t=%t:  $r%0d @Loc S_Addr=%h,  S=%h ||",
						$time, i, S_Addr, S, 
						"$r%0d @Loc T_Addr=%h,  T=%h", 
						i+16, T_Addr, T);
		end
		$finish;
	end 
      
endmodule

