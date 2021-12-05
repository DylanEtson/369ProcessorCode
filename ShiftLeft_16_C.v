`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:21:04 PM
// Design Name: 
// Module Name: ShiftLeft_16_C
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


module ShiftLeft_16_C(SLInput, 
                     SLOutput);
                     
    input [31:0] SLInput;
    output [31:0] SLOutput;
    
    assign SLOutput = SLInput << 16; 
    
endmodule