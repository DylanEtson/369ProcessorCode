`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 02:12:01 PM
// Design Name: 
// Module Name: MEM_MEGASAD_COMBO
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


module MEM_MEGASAD_COMBO(Clk, Reset,
                  SAD, RegWriteCtrl, Move, MemRead,
                  SEMux, MemWrite, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  
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
                  oMEMrd, oSAD1rd, oSAD2rd, oSAD3rd,
                  oMEMRegWrite, oSAD1RegWrite, oSAD2RegWrite, oSAD3RegWrite);

input Clk, Reset;
input SAD, RegWriteCtrl, Move, MemRead;
input [1:0] SEMux, MemWrite;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;

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
output [4:0] oMEMrd, oSAD1rd, oSAD2rd, oSAD3rd;
output oMEMRegWrite, oSAD1RegWrite, oSAD2RegWrite, oSAD3RegWrite;

wire woSAD, woRegWriteCtrl, woMove;
wire [1:0] woSEMux;
wire [2:0] woMemToReg;
wire [31:0] woPCPlus4, woALUResult, woReadReg1, woReadReg2, woHi, woLo;
wire woZero;
wire [4:0] woRegDstResult;
wire [63:0] woHiLoResult;
wire woHiLoWrite;
wire [31:0] woMemReadData;
wire [31:0] wo0A, wo0B,
                   wo1A, wo1B,
                   wo2A, wo2B,
                   wo3A, wo3B,
                   wo4A, wo4B,
                   wo5A, wo5B,
                   wo6A, wo6B,
                   wo7A, wo7B;

MEM_STAGE_C   mem(Clk, Reset,
                  SAD, RegWriteCtrl, Move, MemRead,
                  SEMux, MemWrite, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  
                  woSAD, woRegWriteCtrl, woMove,
                  woSEMux, 
                  woMemToReg,
                  woPCPlus4, woZero, woHiLoResult, woALUResult,
                  woReadReg1, woReadReg2, woRegDstResult,
                  woHi, woLo,
                  woHiLoWrite,
                  woMemReadData,
                  wo0A, wo0B,
                   wo1A, wo1B,
                   wo2A, wo2B,
                   wo3A, wo3B,
                   wo4A, wo4B,
                   wo5A, wo5B,
                   wo6A, wo6B,
                   wo7A, wo7B,
                   oMEMrd,
                   oMEMRegWrite);

MEGA_SAD_COMBO sad(Clk, Reset,
                   woSAD, woRegWriteCtrl, woMove,
                  woSEMux, 
                  woMemToReg,
                  woPCPlus4, woZero, woHiLoResult, woALUResult,
                  woReadReg1, woReadReg2, woRegDstResult,
                  woHi, woLo,
                  woHiLoWrite,
                  woMemReadData,
                  wo0A, wo0B,
                   wo1A, wo1B,
                   wo2A, wo2B,
                   wo3A, wo3B,
                   wo4A, wo4B,
                   wo5A, wo5B,
                   wo6A, wo6B,
                   wo7A, wo7B,
                    
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





endmodule
