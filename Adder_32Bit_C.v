`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:33:28 AM
// Design Name: 
// Module Name: Adder_32Bit_C
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


module Adder_32Bit_C(A, B,
                     Out);

input [31:0] A, B;
output [31:0] Out;

assign Out = A + B;

endmodule
