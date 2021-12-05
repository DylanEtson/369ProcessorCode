`timescale 1ns / 1ps

module SAD1_STAGE_C(Clk, Reset,
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
                   
                   
                   
                   oSAD, oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oA, oB, oC, oD, oE, oF, oG, oH, oI, oJ, oK, oL, oM, oN, oO, oP);

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

output oSAD, oRegWriteCtrl, oMove;
output [1:0] oSEMux;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;
output [31:0] oMemReadData;
output [31:0] oA, oB, oC, oD, oE, oF, oG, oH, oI, oJ, oK, oL, oM, oN, oO, oP;

wire [31:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
wire [31:0] o00, o01, o02, o03,
               o10, o11, o12, o13,
               o20, o21, o22, o23,
               o30, o31, o32, o33;

WindowMemory_C window(o00, o01, o02, o03,
                      o10, o11, o12, o13,
                      o20, o21, o22, o23,
                      o30, o31, o32, o33);
               
AbsDiff_16x2To16_C    abs(o00, a0A,
                          o01, a0B,
                          o02, a1A,
                          o03, a1B,
                          o10, a2A,
                          o11, a2B,
                          o12, a3A,
                          o13, a3B,
                          o20, a4A,
                          o21, a4B,
                          o22, a5A,
                          o23, a5B,
                          o30, a6A,
                          o31, a6B,
                          o32, a7A,
                          o33, a7B,
                          
                          A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P);

REG_SAD1_SAD2_C register(Clk, Reset,
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
                  oA, oB, oC, oD, oE, oF, oG, oH, oI, oJ, oK, oL, oM, oN, oO, oP);

endmodule
