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


module WB_STAGE_V2(Clk, Reset,
                   cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                   cZero,
                   PCPlus4, HiLoResult, MemReadData, ALUResult, Hi, Lo,
                   RegDstResult, ReadReg1, HiLoWrite,
                   
                   ocRegWrite, 
                   oRegWriteAddress, oRegWriteData, oHi, oLo, oHiLoWrite);

input Clk, Reset;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input cZero, HiLoWrite;

input [31:0] PCPlus4, MemReadData, ALUResult, Hi, Lo, ReadReg1;
input [63:0] HiLoResult;
input [4:0] RegDstResult;

output ocRegWrite;
output [4:0] oRegWriteAddress;
output [31:0] oHi, oLo;
(* mark_debug = "true" *) output [31:0] oRegWriteData;
output oHiLoWrite;

wire wMoveAndZero;
wire [31:0] wMemToRegResult, wSE8, wSE16;

assign oHi = HiLoResult[63:32];
assign oLo = HiLoResult[31:0];
assign oHiLoWrite = HiLoWrite;

ANDgate andgate(wMoveAndZero, cMove, cZero);
ORgate orgate(ocRegWrite, wMoveAndZero, cRegWriteCtrl);

Mux32Bit2To1 RegAddressMux(oRegWriteAddress, RegDstResult, 5'd31, cRegAddress);

Mux32Bit8To1 MemToRegMux(wMemToRegResult,
                         MemReadData, ALUResult, PCPlus4, ReadReg1,
                         Hi, Lo, MemReadData, MemReadData,
                         cMemToReg);

SignExtend8 se8(wMemToRegResult[7:0], wSE8);
SignExtend16 se16(wMemToRegResult[15:0], wSE16);

Mux32Bit4To1 RegWriteDataMux(oRegWriteData, wMemToRegResult, wSE16, wSE8, wMemToRegResult, cSEMux);



endmodule
