`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit8To1(out, inA, inB, inC, inD, inE, inF, inG, inH, sel);

    output [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [31:0] inD;
    input [31:0] inE;
    input [31:0] inF;
    input [31:0] inG;
    input [31:0] inH;
    input [2:0] sel;

    /* Fill in the implementation here ... */ 
    
    //If sel is 0, out = inA; if sel is 1, out = inB
    assign out = (sel == 3'd0) ? inA :
                 (sel == 3'd1) ? inB :
                 (sel == 3'd2) ? inC :
                 (sel == 3'd3) ? inD :
                 (sel == 3'd4) ? inE :
                 (sel == 3'd5) ? inF :
                 (sel == 3'd6) ? inG :
                 (sel == 3'd7) ? inH :
                 32'bX;

endmodule
