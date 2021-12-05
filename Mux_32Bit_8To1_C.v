`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:12:31 PM
// Design Name: 
// Module Name: Mux_32Bit_8To1_C
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_32Bit_8To1_C(A, B, C, D, E, F, G, H,
                        cSelect,
                        Out);
                        
    input [31:0] A;
    input [31:0] B;
    input [31:0] C;
    input [31:0] D;
    input [31:0] E;
    input [31:0] F;
    input [31:0] G;
    input [31:0] H;
    input [2:0] cSelect;
    
    output [31:0] Out;

    /* Fill in the implementation here ... */
    
    assign Out = (cSelect == 3'd0) ? A :
                 (cSelect == 3'd1) ? B :
                 (cSelect == 3'd2) ? C :
                 (cSelect == 3'd3) ? D :
                 (cSelect == 3'd4) ? E :
                 (cSelect == 3'd5) ? F :
                 (cSelect == 3'd6) ? G :
                 (cSelect == 3'd7) ? H :
                 32'bX;

endmodule
