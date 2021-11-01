`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 06:19:46 AM
// Design Name: 
// Module Name: IF_ID_EX_MEM_COMBO_V2
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


module IF_ID_EX_MEM_COMBO_V2(Clk, Reset,
                             cRegWrite,
                             RegWriteData, RegWriteAddress, Hi, Lo, HiLoWrite,
                             ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                             ocZero,
                             oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                             oRegDstResult, oReadReg1, oHiLoWrite,
                             oPC, oLoDisplay);

input Clk, Reset;

input cRegWrite;
input [31:0] RegWriteData, Hi, Lo;
input [4:0] RegWriteAddress;
input HiLoWrite;

output ocMove, ocRegWriteCtrl, ocRegAddress;
output [2:0] ocMemToReg;
output [1:0] ocSEMux;

output ocZero;

output [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
output [63:0] oHiLoResult;
output [4:0] oRegDstResult;
output [31:0] oPC, oLoDisplay;
output oHiLoWrite;

wire [1:0] wcALUSrcA, wcALUSrcB;
wire wcRegDst, wcJump;
wire [2:0] wcHiLoOp;
wire [4:0] wcALUCtrl;

wire wcBranch, wcMemRead;
wire [1:0] wcMemWrite;

wire wcMove, wcRegWriteCtrl, wcRegAddress;
wire [2:0] wcMemToReg;
wire [1:0] wcSEMux;

wire [31:0] wPCPlus4, wReadReg1, wReadReg2, wSEImm, wSEImm2, wHi, wLo;
wire [4:0] wI2016, wI1511;

wire [31:0] wPCSumImm, wReadReg1IF;
wire wcPCSrc, wcPCMux, wcPCMuxIn;

IF_ID_COMBO_V2   IFID(Clk, Reset,
                      wcPCSrc, wcPCMuxIn,
                      wReadReg1IF, wPCSumImm,
                      cRegWrite,
                      RegWriteData, RegWriteAddress, Hi, Lo, HiLoWrite,
                      wcALUSrcA, wcALUSrcB, wcRegDst, wcHiLoOp, wcALUCtrl, wcJump,
                      wcBranch, wcPCMux, wcMemWrite, wcMemRead,
                      wcMove, wcRegWriteCtrl, wcMemToReg, wcSEMux, wcRegAddress,
                      wPCPlus4, wReadReg1, wReadReg2, wSEImm, wSEImm2, wI2016, wI1511, wHi, wLo,
                      oPC);
                      
EX_MEM_COMBO_V2  EXMEM(Clk, Reset,
                       wcALUSrcA, wcALUSrcB, wcRegDst, wcHiLoOp, wcALUCtrl, wcJump,
                       wcBranch, wcPCMux, wcMemWrite, wcMemRead,
                       wcMove, wcRegWriteCtrl, wcMemToReg, wcSEMux, wcRegAddress,
                       wPCPlus4, wReadReg1, wReadReg2, wSEImm, wSEImm2, wI2016, wI1511, wHi, wLo,
                   
                       ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                       ocZero,
                       oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                       oRegDstResult, oReadReg1, oHiLoWrite,
                    
                       wcPCSrc, wcPCMuxIn, wPCSumImm, wReadReg1IF);

assign oLoDisplay = wLo;

endmodule
