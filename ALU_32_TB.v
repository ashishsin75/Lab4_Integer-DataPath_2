`timescale 1ns / 100ps
/************************************************************************
 * Name: MIPS_ALU32_TB.v
 * Date: August 13, 2017
 *
 * This test bench is to verify the ability to use our 32-bit ALU
 *
 *  0 - Pass_S   7 - SLTU   E  - SRA     15 - SP_INIT
 *  1 - Pass_T   8 - AND    F  - INC     16 - ANDI
 *  2 - ADD      9 - OR     10 - DEC     17 - ORI
 *  3 - ADDU     A - XOR    11 - INC4    18 - XORI
 *  4 - SUB      B - NOR    12 - DEC4    19 - LUI
 *  5 - SUBU     C - SLL    13 - ZEROS   1E - MUL
 *  6 - SLT      D - SRL    14 - ONES    1F - DIV
 *
 ************************************************************************/

//************************************
  module ALU_32_TB;
//************************************

   reg  [31:0]   SData, TData;     // for test data into the IDP
   reg   [4:0]   Opcode;           // 5-bit alu opcode
   wire [31:0]   y_hi, y_lo;       // Data output from ALU
   wire          c, v, n, z;       // status output bits
   integer       i;
   reg           clk;
// module Top_Level_ALU_32(Opcode, SData, TData, y_hi, y_lo, n, z, v, c);
   // ************ instantiate the ALU ************ 
   ALU_32 alu_ver1 (Opcode, SData, TData, y_hi, y_lo, n, z, v, c);
   // Create a 10 ns clock
   always
     #5 clk=~clk;

   initial  begin
     $timeformat(-9, 1, " ps", 9);    //Display time in nanoseconds
     clk     = 1'b0;
     
     //wait for global reset
     //#100
    
     $display(" "); $display(" ");
     $display(
	  "***********************************************************************");
     $display(
	  "   C E C S    4 4 0    A_L_U    T e s t b e n c h      R e s u l t s   ");
     $display(
	  "***********************************************************************");
     $display(" ");
     @(negedge clk)
     for (i=0; i<8; i=i+1) begin
        case (i)
          0  : $display("PASS S tests");
          1  : $display("PASS T tests");
          2  : $display("ADD tests");
          3  : $display("ADDU tests");
          4  : $display("SUB tests");
          5  : $display("SUBU tests");
          6  : $display("SLT tests");
          7  : $display("SLTU tests");
        endcase

        @(negedge clk)  // TEST #1: both operands positive
          Opcode=i;  
          SData = 32'h0000_0025;   // decimal 37
          TData = 32'h0000_001D;   // decimal 29         
          #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);


        @(negedge clk)  // TEST #2: S positive and T negative
          Opcode=i;  
          SData = 32'h0000_020D;   // decimal  525
          TData = 32'hFFFF_FFE3;   // decimal -29 
          #1 $display("t=%t S=%h, T=%h  Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);


        @(negedge clk)  // TEST #3: S negative and T positive
          Opcode=i;  
          SData = 32'hFFFF_FFC9;   // decimal -55
          TData = 32'h0000_000D;   // decimal  13 
          #1 $display("t=%t  S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);


        @(negedge clk)  // TEST #4: both operands negative
          Opcode=i;  
          SData = 32'hFFFF_FF9C;   // decimal -100
          TData = 32'hFFFF_FF9D;   // decimal -99 
          #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h  Ylo=%h c=%b v=%b n=%b z=%b",
                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

        $display("");
     end // end-for


     for (i=8; i<26; i=i+1) begin
        case (i)
          8  : $display("AND test");
          9  : $display("OR test");
          10 : $display("XOR test");
          11 : $display("NOR test");
          12 : $display("SLL test");
          13 : $display("SRL test");
          14 : $display("SRA test");
          15 : $display("INC test");
          16 : $display("DEC test");
          17 : $display("INC4 test");
          18 : $display("DEC4 test");
          19 : $display("ZEROS test");
          20 : $display("ONES test");
          21 : $display("SP_INIT test");
          22 : $display("ANDI test");
          23 : $display("ORI test");
          24 : $display("XORI test");
          25 : $display("LUI test");
        endcase
        @(negedge clk)
          Opcode=i;  
			 //SData = 32'h0000_000F;
			 //TData = 32'h0000_0000;     
          SData = 32'hF0F0_3C3C;
          TData = 32'hBF0F_F5F5;     
          #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

        $display("");                 
     end //end-for
//			$display(""); 
//       @(negedge clk)
//          Opcode=5'h08;  
//			 //SData = 32'h0000_000F;
//			 //TData = 32'h0000_0000;     
//          SData = 32'hF0F0_3C3C;
//          TData = 32'hBF0F_F5F5;     
//          #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
//                      $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
//
//        $display(""); 
     //now test MPY Unit
     $display("MULT tests");
     @(negedge clk)  // TEST #1: S positive and T positive
       Opcode = 5'h1E;
       SData = 32'h0000_0025;   // decimal 37
       TData = 32'h0000_001D;   // decimal 29   
     @(posedge clk)       
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
                   
     
     @(negedge clk)  // TEST #2: S positive and T negative
       Opcode = 5'h1E;
       SData = 32'h0000_020D;   // decimal  525
       TData = 32'hFFFF_FFE3;   // decimal -29 
     @(posedge clk)
       #1 $display("t=%t S=%h,T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

     @(negedge clk)  // TEST #3: S negative and T positive 
       Opcode = 5'h1E;
       SData = 32'hFFFF_FFC9;   // decimal -55
       TData = 32'h0000_000D;   // decimal  13 
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

     @(negedge clk)  // TEST #4: both operands negative 
       Opcode = 5'h1E;
       SData = 32'hFFFF_FF9D;   // decimal -99
       TData = 32'hFFFF_FF9C;   // decimal -100 
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
        $display("");     

     //now test DIV Unit
     $display("DIV tests");
     @(negedge clk)  // TEST #1: S positive and T positive
       Opcode = 5'h1F;
       SData = 32'h0000_0025;   // decimal 37
       TData = 32'h0000_001D;   // decimal 29   
     @(posedge clk)       
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
                   
     
     @(negedge clk)  // TEST #2: S positive and T negative
       Opcode = 5'h1F;
       SData = 32'h0000_020D;   // decimal  525
       TData = 32'hFFFF_FFE3;   // decimal -29 
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

     @(negedge clk)  // TEST #3: S negative and T positive 
       Opcode = 5'h1F;
       SData = 32'hFFFF_FFC9;   // decimal -55
       TData = 32'h0000_000D;   // decimal  13 
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);

     @(negedge clk)  // TEST #4: both operands negative 
       Opcode = 5'h1F;
       SData = 32'hFFFF_FF9D;   // decimal -99
       TData = 32'hFFFF_FF9C;   // decimal -100 
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
		// This is to test is Z flag is high impedence when dividing by 0
         @(negedge clk)  // TEST #5: S positive and T is zero S/0
       Opcode = 5'h1F;
       SData = 32'h0000_000D;   // decimal  13 
       TData = 32'h0000_0000;	  // decimal	0
     @(posedge clk)
       #1 $display("t=%t S=%h, T=%h Op=%d || Yhi=%h Ylo=%h c=%b v=%b n=%b z=%b",
                   $time, SData,TData,Opcode,y_hi,y_lo,c,v,n,z);
     $finish;
   end   //end-initial

endmodule  // end of test bench