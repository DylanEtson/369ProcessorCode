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


module MEM_STAGE_V2(Clk, Reset,
                    cBranch, cPCMux, cMemWrite, cMemRead,
                    cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                    cZero,
                    PCPlus4, PCSumImm, HiLoResult, ALUResult, Hi, Lo,
                    ReadReg1, ReadReg2, RegDstResult,
                    HiLoWrite,
                    
                    ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                    ocZero,
                    oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                    oRegDstResult, oReadReg1,
                    oHiLoWrite,
                    
                    ocPCSrc, ocPCMux, oPCSumImm, oReadReg1IF);

input Clk, Reset;

input cBranch, cPCMux, cMemRead;
input [1:0] cMemWrite;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input cZero, HiLoWrite;

input [31:0] PCPlus4, PCSumImm, ALUResult, Hi, Lo, ReadReg1, ReadReg2;
input [63:0] HiLoResult;
input [4:0] RegDstResult;

output ocMove, ocRegWriteCtrl, ocRegAddress;
output [2:0] ocMemToReg;
output [1:0] ocSEMux;

output ocZero, oHiLoWrite;

output [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
output [63:0] oHiLoResult;
output [4:0] oRegDstResult;

output ocPCSrc, ocPCMux;
output [31:0] oPCSumImm, oReadReg1IF;

wire [31:0] wMemReadData;

assign ocPCMux = cPCMux;
assign oPCSumImm = PCSumImm;
assign oReadReg1IF = ReadReg1;

ANDgate andgate(ocPCSrc, cBranch, cZero);

DataMemory memory(ALUResult, ReadReg2, Clk, cMemWrite, cMemRead, wMemReadData);

MEM_WB_REG_V2 MEMREG(Clk, Reset,
                     cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                     cZero,
                     PCPlus4, HiLoResult, wMemReadData, ALUResult, Hi, Lo,
                     RegDstResult, ReadReg1,
                     HiLoWrite,
                     
                     ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                     ocZero,
                     oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                     oRegDstResult, oReadReg1,
                     oHiLoWrite);

endmodule
