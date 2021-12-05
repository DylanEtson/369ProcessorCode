`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 04:03:34 PM
// Design Name: 
// Module Name: Multiplier_32Bit_C
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


module Multiplier_32Bit_C(A, B, out);

input [31:0] A, B;
output [31:0] out;

assign out = A * B;

endmodule
