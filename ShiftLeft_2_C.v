`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:20:32 PM
// Design Name: 
// Module Name: ShiftLeft_2_C
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


module ShiftLeft_2_C(SLInput, 
                     SLOutput);
                     
    input [31:0] SLInput;
    output [31:0] SLOutput;
    
    assign SLOutput = SLInput << 2; 
    
endmodule
