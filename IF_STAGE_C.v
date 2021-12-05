`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:38:25 AM
// Design Name: 
// Module Name: IF_STAGE_C
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


module IF_STAGE_C(Clk, Reset,
                  cPCWrite, cWrite, cFlush, cPCSrc,
                  ReadReg1, PCSumImm, SEImm26, IDPCPlus4,
                  
                  oPCPlus4, oInstruction, oCache);

input Clk, Reset;
input cPCWrite, cWrite, cFlush;
input [2:0] cPCSrc;
input [31:0] ReadReg1, PCSumImm, SEImm26, IDPCPlus4;

output [31:0] oPCPlus4, oInstruction;
output oCache;

wire wcCache;
wire [31:0] wAddress, wCacheAddress, wPCPlus4, wInstruction;
(* mark_debug = "true" *) wire [31:0] PC;

ProgramCounter_C counter(Clk, Reset,
                         cPCWrite, wcCache,
                         wAddress, wCacheAddress,
                         
                         PC);

Adder_32Bit_C PCadder(PC, 32'd4,
                      wPCPlus4);

InstructionMemory_C memory(PC,
                           wInstruction);
                         
Mux_32Bit_8To1_C PCSrcMux(wPCPlus4, PCSumImm, SEImm26, ReadReg1, IDPCPlus4, wPCPlus4, wPCPlus4, wPCPlus4, 
                          cPCSrc,
                          wAddress);
                                              
BranchCache_C cache(PC,
                    wCacheAddress, wcCache);

REG_IF_ID_C register(Clk, Reset,
                     cWrite, cFlush,
                     wPCPlus4, wInstruction,
                     wcCache,
                     
                     oPCPlus4, oInstruction,
                     oCache);






endmodule
