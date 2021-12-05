`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 10:15:51 PM
// Design Name: 
// Module Name: MEGA_SAD_COMBO
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


module MEGA_SAD_COMBO(Clk, Reset,
                   SAD, RegWriteCtrl, Move,
                   SEMux, 
                   MemToReg,
                   PCPlus4, Zero, HiLoResult, ALUResult,
                   ReadReg1, ReadReg2, RegDstResult,
                   Hi, Lo,
                   HiLoWrite,
                   MemReadData,
                   a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B,
                    
                  oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oRegWrite2WB,
                  oSum,
                  oSAD1rd, oSAD2rd, oSAD3rd,
                  oSAD1RegWrite, oSAD2RegWrite, oSAD3RegWrite);

input Clk, Reset;
input SAD, RegWriteCtrl, Move;
input [1:0] SEMux;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;
input [31:0] MemReadData;
input [31:0] a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B;

output oRegWriteCtrl, oMove;
output [1:0] oSEMux;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;
output [31:0] oMemReadData;
output oRegWrite2WB;
output [31:0] oSum;
output [4:0] oSAD1rd, oSAD2rd, oSAD3rd;
output oSAD1RegWrite, oSAD2RegWrite, oSAD3RegWrite;

wire wSAD, wRegWriteCtrl, wMove;
wire [1:0] wSEMux;
wire [2:0] wMemToReg;
wire [31:0] wPCPlus4, wALUResult, wReadReg1, wReadReg2, wHi, wLo;
wire wZero;
wire [4:0] wRegDstResult;
wire [63:0] wHiLoResult;
wire wHiLoWrite;
wire [31:0] wMemReadData;
wire [31:0] wA, wB, wC, wD, wE, wF, wG, wH, wI, wJ, wK, wL, wM, wN, wO, wP;

wire woSAD, woRegWriteCtrl, woMove;
wire [1:0] woSEMux;
wire [2:0] woMemToReg;
wire [31:0] woPCPlus4, woALUResult, woReadReg1, woReadReg2, woHi, woLo;
wire woZero;
wire [4:0] woRegDstResult;
wire [63:0] woHiLoResult;
wire woHiLoWrite;
wire [31:0] woMemReadData;
wire [31:0] woA2, woB2, woC2, woD2;

assign oSAD1rd = RegDstResult;
assign oSAD2rd = wRegDstResult;
assign oSAD3rd = woRegDstResult;
assign oSAD1RegWrite = RegWriteCtrl;
assign oSAD2RegWrite = wRegWriteCtrl;
assign oSAD3RegWrite = woRegWriteCtrl;


SAD1_STAGE_C sad1(Clk, Reset,
                   SAD, RegWriteCtrl, Move,
                   SEMux, 
                   MemToReg,
                   PCPlus4, Zero, HiLoResult, ALUResult,
                   ReadReg1, ReadReg2, RegDstResult,
                   Hi, Lo,
                   HiLoWrite,
                   MemReadData,
                   a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B,
                   
                  wSAD, wRegWriteCtrl, wMove,
                  wSEMux, 
                  wMemToReg,
                  wPCPlus4, wZero, wHiLoResult, wALUResult,
                  wReadReg1, wReadReg2, wRegDstResult,
                  wHi, wLo,
                  wHiLoWrite,
                  wMemReadData,
                  wA, wB, wC, wD, wE, wF, wG, wH, wI, wJ, wK, wL, wM, wN, wO, wP);

SAD2_STAGE_C sad2(Clk, Reset,
                  wSAD, wRegWriteCtrl, wMove,
                  wSEMux, 
                  wMemToReg,
                  wPCPlus4, wZero, wHiLoResult, wALUResult,
                  wReadReg1, wReadReg2, wRegDstResult,
                  wHi, wLo,
                  wHiLoWrite,
                  wMemReadData,
                  wA, wB, wC, wD, wE, wF, wG, wH, wI, wJ, wK, wL, wM, wN, wO, wP,
                   
                   woSAD, woRegWriteCtrl, woMove,
                   woSEMux, 
                   woMemToReg,
                   woPCPlus4, woZero, woHiLoResult, woALUResult,
                   woReadReg1, woReadReg2, woRegDstResult,
                   woHi, woLo,
                   woHiLoWrite,
                   woMemReadData,
                   woA2, woB2, woC2, woD2);

SAD3_STAGE_C sad3(Clk, Reset,
                  woSAD, woRegWriteCtrl, woMove,
                   woSEMux, 
                   woMemToReg,
                   woPCPlus4, woZero, woHiLoResult, woALUResult,
                   woReadReg1, woReadReg2, woRegDstResult,
                   woHi, woLo,
                   woHiLoWrite,
                   woMemReadData,
                   woA2, woB2, woC2, woD2,
                   
                  oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oRegWrite2WB,
                  oSum);


endmodule
