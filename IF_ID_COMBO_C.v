`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 02:53:10 PM
// Design Name: 
// Module Name: IF_ID_COMBO_C
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


module IF_ID_COMBO_C(Clk, Reset,
                     newHi, newLo, HiLoWrite,
                     RegWrite2WB,
                     cRegWrite1, RegWriteAddress1, WriteData1,
                     ReadReg2WB,
                     EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                     EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,
                     
                     oSAD, oRegWriteCtrl, oMove, oMemRead,
                     oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite, 
                     oMemToReg, oHiLoOp, 
                     oALUCtrl,
                     oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo,
                     oI2016, oI1511,  
                     oV0, oV1);

input Clk, Reset;
input [31:0] newHi, newLo;
input RegWrite2WB, cRegWrite1;
input [4:0] RegWriteAddress1;
input [31:0] WriteData1, ReadReg2WB;
input HiLoWrite;
input [4:0] EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd;
input EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite;

output oSAD, oRegWriteCtrl, oMove, oMemRead;
output [1:0] oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite; 
output [2:0] oMemToReg, oHiLoOp;
output [4:0] oALUCtrl;
output [31:0] oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo;
output [4:0] oI2016, oI1511;
output [31:0] oV0, oV1;

wire woPCWrite, woIFIDWrite, woIFIDFlush;
wire [2:0] woPCSrc;
wire [31:0] woSEImm26ToIF, woReadReg1ToIF, woPCPlus4ToIF, woPCSumImmToIF;
wire [31:0] woPCPlus4, woInstruction;
wire wCache;

IF_STAGE_C ifstage(Clk, Reset,
                  woPCWrite, woIFIDWrite, woIFIDFlush, woPCSrc,
                  woReadReg1ToIF, woPCSumImmToIF, woSEImm26ToIF, woPCPlus4ToIF,
                  
                  woPCPlus4, woInstruction, wCache);

ID_STAGE_C idstage(Clk, Reset,
                  woPCPlus4, woInstruction,
                  newHi, newLo, HiLoWrite,
                  RegWrite2WB,
                  cRegWrite1, RegWriteAddress1, WriteData1,
                  ReadReg2WB,
                  wCache,
                  EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                  EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,

                  oSAD, oRegWriteCtrl, oMove, oMemRead,
                  oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite, 
                  oMemToReg, oHiLoOp, 
                  oALUCtrl,
                  oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo,
                  oI2016, oI1511,
                  woSEImm26ToIF, woReadReg1ToIF, woPCPlus4ToIF, woPCSumImmToIF,
                  woPCSrc,
                  woPCWrite, woIFIDWrite,
                  woIFIDFlush,
                  oV0, oV1);


endmodule
