`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 08:44:12 PM
// Design Name: 
// Module Name: WB_STAGE_C
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


module WB_STAGE_C(Clk, Reset,
                  RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  MemReadData,
                  RegWrite2WB,
                  
                  oRegWrite1, oRegWrite2WB,
                  oHiLoWrite,
                  oHiLoResult,
                  oReadReg2,
                  oRegDstResult,
                  oRegWriteData);

input Clk, Reset;
input RegWriteCtrl, Move;
input [1:0] SEMux;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;
input [31:0] MemReadData;
input RegWrite2WB;

output oRegWrite1, oRegWrite2WB;
output oHiLoWrite;
output [63:0] oHiLoResult;
output [31:0] oReadReg2, oRegWriteData;
output [4:0]  oRegDstResult;
                  
wire wMoveAndZero;
wire [31:0] wMemToRegResult, wSE16, wSE8;    
wire wRegWriteIntermediate;          
                  
AND_Gate_C andgate(Zero, Move, wMoveAndZero);
OR_Gate_C orgate (wMoveAndZero, RegWriteCtrl, wRegWriteIntermediate);
OR_Gate_C orgate2(wRegWriteIntermediate, RegWrite2WB, oRegWrite1);

assign oHiLoWrite = HiLoWrite;
assign oHiLoResult = HiLoResult;
assign oReadReg2 = ReadReg2;
assign oRegDstResult = RegDstResult;
assign oRegWrite2WB = RegWrite2WB;

Mux_32Bit_8To1_C mux(MemReadData, ALUResult, PCPlus4, ReadReg1, Hi, Lo, 32'd0, 32'd0, 
                     MemToReg, 
                     wMemToRegResult);

SignExtend_16to32_C se16(wMemToRegResult[15:0], wSE16);
SignExtend_8To32_C se8(wMemToRegResult[7:0], wSE8);

Mux_32Bit_4To1_C seMux(wMemToRegResult, wSE16, wSE8, wMemToRegResult, SEMux, oRegWriteData);

endmodule
