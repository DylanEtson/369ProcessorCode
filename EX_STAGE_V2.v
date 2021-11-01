`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 01:50:47 AM
// Design Name: 
// Module Name: WB_STAGE_V2
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


module EX_STAGE_V2(Clk, Reset,
                   cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl, cJump,
                   cBranch, cPCMux, cMemWrite, cMemRead,
                   cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                   PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, I2016, I1511, Hi, Lo,
                   
                   ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                   ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                   ocZero,
                   oPCPlus4, oPCSumImm, oHiLoResult, oALUResult, oHi, oLo,
                   oReadReg1, oReadReg2, oRegDstResult, oHiLoWrite);

input Clk, Reset;                   
input [1:0] cALUSrcA, cALUSrcB;
input cRegDst, cJump;
input [2:0] cHiLoOp;
input [4:0] cALUCtrl;

input cBranch, cPCMux, cMemRead;
input [1:0] cMemWrite;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input [31:0] PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, Hi, Lo;
input [4:0] I2016, I1511;                   
                   
output ocBranch, ocPCMux, ocMemRead;
output [1:0] ocMemWrite;

output ocMove, ocRegWriteCtrl, ocRegAddress;
output [2:0] ocMemToReg;
output [1:0] ocSEMux;

output ocZero, oHiLoWrite;

output [31:0] oPCPlus4, oPCSumImm, oALUResult, oHi, oLo, oReadReg1, oReadReg2;
output [63:0] oHiLoResult;
output [4:0] oRegDstResult;

wire [31:0] wSEImmSL2, wSEImm2SL2, wPCSumImm, wSEImmSL16,  wAInput, wBInput;
wire [31:0] wPCNext;
wire [4:0] wRegDstResult;
wire [63:0] wALUResult, wHiLoResult; 
wire wcZero, wHiLoWrite;

ShiftLeft2 shiftLeft2_26(SEImm2, wSEImm2SL2);
ShiftLeft2 shiftLeft2_16(SEImm, wSEImmSL2);
Adder32Bit adder(wPCSumImm, wSEImmSL2, PCPlus4);
Mux32Bit2To1 JumpMux(wPCNext, wPCSumImm, wSEImm2SL2, cJump);

Mux32Bit2To1 RegDstMux(wRegDstResult, I2016, I1511, cRegDst);

ShiftLeft16 shiftLeft16(SEImm, wSEImmSL16);
Mux32Bit4To1 ALUSrcMuxA(wAInput, ReadReg1, ReadReg2, 32'b0, ReadReg1, cALUSrcA);
Mux32Bit4To1 ALUSrcMuxB(wBInput, ReadReg2, SEImm, wSEImmSL16, 32'b0, cALUSrcB);

ALU32Bit ALU(cALUCtrl, wAInput, wBInput, wALUResult, wcZero);
HiLoALU HiLo(cHiLoOp, wALUResult, {Hi, Lo}, wHiLoResult, wHiLoWrite);

EX_MEM_REG_V2 EXMEMREG(Clk, Reset,
                     cBranch, cPCMux, cMemWrite, cMemRead,
                     cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                     wcZero,
                     PCPlus4, wPCNext, wHiLoResult, wALUResult[31:0], Hi, Lo,
                     ReadReg1, ReadReg2, wRegDstResult,
                     wHiLoWrite,
                     
                     ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                     ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                     ocZero,
                     oPCPlus4, oPCSumImm, oHiLoResult, oALUResult, oHi, oLo,
                     oReadReg1, oReadReg2, oRegDstResult,
                     oHiLoWrite);

endmodule
