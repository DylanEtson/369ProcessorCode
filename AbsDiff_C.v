`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 05:28:17 PM
// Design Name: 
// Module Name: AbsDiff_C
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


module AbsDiff_C(A, B, 
                 Output);

input [31:0] A, B;
output [31:0] Output;

assign Output = (A > B) ? A - B :
                          B - A;

endmodule
