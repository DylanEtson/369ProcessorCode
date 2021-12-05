`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:36:21 AM
// Design Name: 
// Module Name: Mux_32Bit_2To1_C
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


module Mux_32Bit_2To1_C(A, B,
                        cSelect,
                        
                        Out);
                        
    input [31:0] A;
    input [31:0] B;
    input cSelect;
    
    output [31:0] Out;

    
    //If sel is 0, out = inA; if sel is 1, out = inB
    assign Out = (cSelect == 0) ? A :
                 (cSelect == 1) ? B :
                 32'bX;

endmodule
