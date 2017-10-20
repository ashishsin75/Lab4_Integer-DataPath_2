`timescale 1ns / 1ps
/****************************** C E C S  4 4 0 ******************************
 * 
 * File Name:  Data_Memory.v
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
module Data_Memory(clk, Address, D_In, dm_cs, dm_wr, dm_rd, D_Out);
	input					clk;
	// Address and Data In
	input		[31:0] 	Address;
	input		[31:0]   D_In;
	// dm_cs: data memory chip select
	// dm_wr: data memory write(Synchronous)
	// dm_rd: data memory read(Asynchronous)
	input 				dm_cs, dm_wr, dm_rd;
	// Data Out
	output 	[31:0]	D_Out;
	/* Memory structure: 4096x8 byte addressable 
		(i.e.1024x32) BIG_ENDIAN
	*/
	reg [7:0] Memory [4095:0]; 
	
	// Reading - No Clock; Asynchronous
	// In this case we are reading only NO need to worry about write** Please del this comment after reading
	// We only need Address[11:0] per lab specs not the whole 32 bit address!!
	assign D_Out = {(dm_cs & dm_rd)} ? 
													{Memory[Address[11:0]],
													 Memory[Address[11:0] + 2'd1],
													 Memory[Address[11:0] + 2'd2],
													 Memory[Address[11:0] + 2'd3]} : 32'bz;
	// Writing - Clock; Synchronous
	// Why did you make read low active above? I changed it back to normal.
	// The case below we are only writing don't worry about read as it's being asserted above
	always @(posedge clk)begin
		if(dm_cs && dm_wr)begin
													Memory[Address[11:0]]        <= D_In[31:24];
													Memory[Address[11:0] + 2'd1] <= D_In[23:16];				
													Memory[Address[11:0] + 2'd2] <= D_In[15:8];
													Memory[Address[11:0] + 2'd3] <= D_In[7:0];
		end 
		//else begin
		//											Memory[Address] <= Memory[Address];
		//end
	end
endmodule

