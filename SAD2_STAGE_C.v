`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 08:16:44 PM
// Design Name: 
// Module Name: SAD2_STAGE_C
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


module SAD2_STAGE_C(Clk, Reset,
                   SAD, RegWriteCtrl, Move,
                   SEMux, 
                   MemToReg,
                   PCPlus4, Zero, HiLoResult, ALUResult,
                   ReadReg1, ReadReg2, RegDstResult,
                   Hi, Lo,
                   HiLoWrite,
                   MemReadData,
                   A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                   
                   oSAD, oRegWriteCtrl, oMove,
                   oSEMux, 
                   oMemToReg,
                   oPCPlus4, oZero, oHiLoResult, oALUResult,
                   oReadReg1, oReadReg2, oRegDstResult,
                   oHi, oLo,
                   oHiLoWrite,
                   oMemReadData,
                   oA2, oB2, oC2, oD2);

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
input [31:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;

output oSAD, oRegWriteCtrl, oMove;
output [1:0] oSEMux;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;
output [31:0] oMemReadData;
output [31:0] oA2, oB2, oC2, oD2;

wire [31:0] wA2, wB2, wC2, wD2;

Adder_16To4_C  adder(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                     wA2, wB2, wC2, wD2);

REG_SAD2_SAD3_C register(Clk, Reset,
                  SAD, RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  MemReadData,
                  wA2, wB2, wC2, wD2,
                  
                  oSAD, oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oA2, oB2, oC2, oD2);

endmodule
