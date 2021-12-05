`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:05:56 PM
// Design Name: 
// Module Name: Adder_4To1_C
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

module Adder_4To1_C(A, B, C, D,
                    out);
                    
input [31:0] A, B, C, D;
output [31:0] out;

wire [31:0] wAB, wCD;                    

Adder_32Bit_C AB(A, B, wAB);
Adder_32Bit_C CD(C, D, wCD);

Adder_32Bit_C ABCD(wAB, wCD, out);
                    
endmodule
