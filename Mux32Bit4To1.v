`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit4To1(out, inA, inB, inC, inD, sel);

    output [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [31:0] inD;
    input [1:0] sel;

    /* Fill in the implementation here ... */
    
    assign out = (sel == 2'd0) ? inA :
                 (sel == 2'd1) ? inB :
                 (sel == 2'd2) ? inC :
                 (sel == 2'd3) ? inD :
                 32'bX;

endmodule
