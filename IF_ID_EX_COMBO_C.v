`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 06:19:56 PM
// Design Name: 
// Module Name: IF_ID_EX_COMBO_C
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


module IF_ID_EX_COMBO_C(Clk, Reset,
                     newHi, newLo, HiLoWrite,
                     RegWrite2WB,
                     cRegWrite1, RegWriteAddress1, WriteData1,
                     ReadReg2WB,
                     MEMrd, SAD1rd, SAD2rd, SAD3rd,
                     MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,
                     
                     oSAD, oRegWriteCtrl, oMove, oMemRead,
                     oSEMux, oMemWrite, 
                     oMemToReg,
                     oPCPlus4, oZero, oHiLoResult, oALUResult,
                     oReadReg1, oReadReg2, oRegDstResult,
                     oHi, oLo,
                     oHiLoWrite,
                     oV0, oV1);

input Clk, Reset;
input [31:0] newHi, newLo;
input RegWrite2WB, cRegWrite1;
input [4:0] RegWriteAddress1;
input [31:0] WriteData1, ReadReg2WB;
input HiLoWrite;
input [4:0] MEMrd, SAD1rd, SAD2rd, SAD3rd;
input MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite;

output oSAD, oRegWriteCtrl, oMove, oMemRead;
output [1:0] oSEMux, oMemWrite;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;
output [31:0] oV0, oV1;

wire woSAD, woRegWriteCtrl, woMove, woMemRead;
wire [1:0] woRegDst, woSEMux, woALUSrcA, woALUSrcB, woMemWrite; 
wire [2:0] woMemToReg, woHiLoOp;
wire [4:0] woALUCtrl;
wire [31:0] woReadReg1, woReadReg2, woPCPlus4, woSEImm, woHi, woLo;
wire [4:0] woI2016, woI1511, wEXrd;

IF_ID_COMBO_C   ifid(Clk, Reset,
                     newHi, newLo, HiLoWrite,
                     RegWrite2WB,
                     cRegWrite1, RegWriteAddress1, WriteData1,
                     ReadReg2WB,
                     wEXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                     woRegWriteCtrl, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,
                     
                     woSAD, woRegWriteCtrl, woMove, woMemRead,
                     woRegDst, woSEMux, woALUSrcA, woALUSrcB, woMemWrite, 
                     woMemToReg, woHiLoOp, 
                     woALUCtrl,
                     woReadReg1, woReadReg2, woPCPlus4, woSEImm, woHi, woLo,
                     woI2016, woI1511,  
                     oV0, oV1);

EX_STAGE_C exstage(Clk, Reset,
                  woSAD, woRegWriteCtrl, woMove, woMemRead,
                  woRegDst, woSEMux, woALUSrcA, woALUSrcB, woMemWrite, 
                  woMemToReg, woHiLoOp, 
                  woALUCtrl,
                  woReadReg1, woReadReg2, woPCPlus4, woSEImm, woHi, woLo,
                  woI2016, woI1511,  
                  
                  oSAD, oRegWriteCtrl, oMove, oMemRead,
                  oSEMux, oMemWrite, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  wEXrd);

endmodule
