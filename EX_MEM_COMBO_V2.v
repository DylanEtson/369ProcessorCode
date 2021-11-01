`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 05:58:35 AM
// Design Name: 
// Module Name: EX_MEM_COMBO_V2
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


module EX_MEM_COMBO_V2(Clk, Reset,
                       cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl, cJump,
                       cBranch, cPCMux, cMemWrite, cMemRead,
                       cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                       PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, I2016, I1511, Hi, Lo,
                   
                       ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                       ocZero,
                       oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                       oRegDstResult, oReadReg1, oHiLoWrite,
                    
                       ocPCSrc, ocPCMux, oPCSumImm, oReadReg1IF);
                       
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

output ocMove, ocRegWriteCtrl, ocRegAddress;
output [2:0] ocMemToReg;
output [1:0] ocSEMux;

output ocZero, oHiLoWrite;

output [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
output [63:0] oHiLoResult;
output [4:0] oRegDstResult;

output ocPCSrc, ocPCMux;
output [31:0] oPCSumImm, oReadReg1IF;

wire wcBranch, wcPCMux, wcMemRead;
wire [1:0] wcMemWrite;

wire wcMove, wcRegWriteCtrl, wcRegAddress;
wire [2:0] wcMemToReg;
wire [1:0] wcSEMux;

wire wcZero, wHiLoWrite;

wire [31:0] wPCPlus4, wPCSumImm, wALUResult, wHi, wLo, wReadReg1, wReadReg2;
wire [63:0] wHiLoResult;
wire [4:0] wRegDstResult;

EX_STAGE_V2     EX(Clk, Reset,
                   cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl, cJump,
                   cBranch, cPCMux, cMemWrite, cMemRead,
                   cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                   PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, I2016, I1511, Hi, Lo,
                   
                   wcBranch, wcPCMux, wcMemWrite, wcMemRead,
                   wcMove, wcRegWriteCtrl, wcMemToReg, wcSEMux, wcRegAddress,
                   wcZero,
                   wPCPlus4, wPCSumImm, wHiLoResult, wALUResult, wHi, wLo,
                   wReadReg1, wReadReg2, wRegDstResult,
                   wHiLoWrite);

MEM_STAGE_V2    MEM(Clk, Reset,
                    wcBranch, wcPCMux, wcMemWrite, wcMemRead,
                    wcMove, wcRegWriteCtrl, wcMemToReg, wcSEMux, wcRegAddress,
                    wcZero,
                    wPCPlus4, wPCSumImm, wHiLoResult, wALUResult, wHi, wLo,
                    wReadReg1, wReadReg2, wRegDstResult, wHiLoWrite,
                    
                    ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                    ocZero,
                    oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                    oRegDstResult, oReadReg1, oHiLoWrite,
                    
                    ocPCSrc, ocPCMux, oPCSumImm, oReadReg1IF);




endmodule
