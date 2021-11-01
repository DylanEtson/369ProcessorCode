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


module ID_STAGE_V2(Clk, Reset,
                   cRegWrite,
                   PCPlus4, Instruction, RegWriteData, RegWriteAddress, Hi, Lo,
                   HiLoWrite,
                   ocALUSrcA, ocALUSrcB, ocRegDst, ocHiLoOp, ocALUCtrl, ocJump,
                   ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                   ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                   oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oI2016, oI1511, oHi, oLo);
                   
input Clk, Reset;
input cRegWrite;
input [31:0] PCPlus4, Instruction, RegWriteData, Hi, Lo;
input [4:0] RegWriteAddress;
input HiLoWrite;

output [1:0] ocALUSrcA, ocALUSrcB;
output ocRegDst, ocJump;
output [2:0] ocHiLoOp;
output [4:0] ocALUCtrl;

output ocBranch, ocPCMux, ocMemRead;
output [1:0] ocMemWrite;

output ocMove, ocRegWriteCtrl, ocRegAddress;
output [2:0] ocMemToReg;
output [1:0] ocSEMux;

output [31:0] oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oHi, oLo;
output [4:0] oI2016, oI1511;

wire [1:0] cALUSrcA, cALUSrcB;
wire cRegDst, cJump;
wire [2:0] cHiLoOp;
wire [4:0] cALUCtrl;

wire cBranch, cPCMux, cMemRead;
wire [1:0] cMemWrite;

wire cMove, cRegWriteCtrl, cRegAddress;
wire [2:0] cMemToReg;
wire [1:0] cSEMux;

wire [31:0] wReadReg1, wReadReg2, wSEImm, wSEImm2;
wire [31:0] wNewHi, wNewLo;

Mux32Bit2To1 hiMux(wNewHi, oHi, Hi, HiLoWrite);
Mux32Bit2To1 loMux(wNewLo, oLo, Lo, HiLoWrite);

RegisterFile regFile(Instruction[25:21], Instruction[20:16], 
                     RegWriteAddress, RegWriteData, cRegWrite, Clk, 
                     wReadReg1, wReadReg2);

SignExtend16 signExtender(Instruction[15:0], wSEImm);
SignExtend26 signExtender2(Instruction[25:0], wSEImm2);

Controller  CTRLR(Instruction,
                  cPCMux, cBranch, cRegWriteCtrl, cMove, cRegDst, cRegAddress, cMemRead, cJump,
                  cSEMux, cALUSrcA, cALUSrcB, cMemWrite,
                  cMemToReg, cHiLoOp,
                  cALUCtrl);

ID_EX_REG_V2 IDEXREG(Clk, Reset,
                     cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl, cJump,
                     cBranch, cPCMux, cMemWrite, cMemRead,
                     cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                     PCPlus4, wReadReg1, wReadReg2, wSEImm, wSEImm2,
                     Instruction[20:16], Instruction[15:11], wNewHi, wNewLo,
                    
                     ocALUSrcA, ocALUSrcB, ocRegDst, ocHiLoOp, ocALUCtrl, ocJump,
                     ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                     ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                     oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oI2016, oI1511, oHi, oLo);


endmodule
