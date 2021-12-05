`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:09:21 PM
// Design Name: 
// Module Name: Mux_32Bit_4To1_C
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


module Mux_32Bit_4To1_C(A, B, C, D,
                        cSelect,
                        Out);
                        
    input [31:0] A;
    input [31:0] B;
    input [31:0] C;
    input [31:0] D;
    input [1:0] cSelect;
    
    output [31:0] Out;

    /* Fill in the implementation here ... */
    
    assign Out = (cSelect == 2'd0) ? A :
                 (cSelect == 2'd1) ? B :
                 (cSelect == 2'd2) ? C :
                 (cSelect == 2'd3) ? D :
                 32'bX;

endmodule
