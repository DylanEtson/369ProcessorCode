`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2021 11:53:26 AM
// Design Name: 
// Module Name: HiLoALU
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


module HiLoALU(ALUControl, NewHiLo, HiLo, ALUResult, HiLoWrite);
    input [63:0] NewHiLo;
    input [63:0] HiLo;
    input [2:0] ALUControl;
    
    output [63:0] ALUResult;
    output HiLoWrite;
    
    
    // Maintain old values
    assign ALUResult = (ALUControl == 3'd0) ? HiLo :
    // Insert new values
                       (ALUControl == 3'd1) ? NewHiLo :
    // Add new and old
                       (ALUControl == 3'd2) ? HiLo + NewHiLo :
    // Subtract old by new
                       (ALUControl == 3'd3) ? HiLo - NewHiLo :
    // Old Hi, new Lo
                       (ALUControl == 3'd4) ? {HiLo[63:32], NewHiLo[31:0]} :
    // New Hi, old lo
                       (ALUControl == 3'd5) ? {NewHiLo[31:0], HiLo[31:0]} :
    // Else
                       HiLo;
                       
    assign HiLoWrite = (ALUControl == 3'd1) ? 1 :
                       (ALUControl == 3'd2) ? 1 :
                       (ALUControl == 3'd3) ? 1 :
                       (ALUControl == 3'd4) ? 1 :
                       (ALUControl == 3'd5) ? 1 :
                       0;

endmodule
