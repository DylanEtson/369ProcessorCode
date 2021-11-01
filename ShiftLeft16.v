`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2021 11:49:52 AM
// Design Name: 
// Module Name: ShiftLeft16
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


module ShiftLeft16(SLInput, SLOutput);
    input [31:0] SLInput;
    output [31:0] SLOutput;
    
    assign SLOutput = SLInput << 16; 
endmodule
