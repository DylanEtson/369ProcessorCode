`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 04:03:37 AM
// Design Name: 
// Module Name: MEM_WB_REG_V2
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


module MEM_WB_REG_V2(Clk, Reset,
                     cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                     cZero,
                     PCPlus4, HiLoResult, MemReadData, ALUResult, Hi, Lo,
                     RegDstResult, ReadReg1,
                     HiLoWrite,
                     
                     ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                     ocZero,
                     oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                     oRegDstResult, oReadReg1,
                     oHiLoWrite);

input Clk, Reset;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input cZero, HiLoWrite;

input [31:0] PCPlus4, MemReadData, ALUResult, Hi, Lo, ReadReg1;
input [63:0] HiLoResult;
input [4:0] RegDstResult;

output reg ocMove, ocRegWriteCtrl, ocRegAddress;
output reg [2:0] ocMemToReg;
output reg [1:0] ocSEMux;

output reg ocZero, oHiLoWrite;

output reg [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
output reg [63:0] oHiLoResult;
output reg [4:0] oRegDstResult;

initial begin
ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

ocZero = 0;
oHiLoWrite = 0;

oPCPlus4 = 0;
oMemReadData = 0;
oALUResult = 0;
oReadReg1 = 0;
oHi = 0;
oLo = 0;
oHiLoResult = 0;
oRegDstResult = 0;
end

always @(posedge Clk) begin
if (Reset == 1) begin
ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

ocZero = 0;
oHiLoWrite = 0;

oPCPlus4 = 0;
oMemReadData = 0;
oALUResult = 0;
oReadReg1 = 0;
oHi = 0;
oLo = 0;
oHiLoResult = 0;
oRegDstResult = 0;
end
else begin
ocMove = cMove;
ocRegWriteCtrl = cRegWriteCtrl; 
ocMemToReg = cMemToReg;
ocSEMux = cSEMux;
ocRegAddress = cRegAddress;

ocZero = cZero;
oHiLoWrite = HiLoWrite;

oPCPlus4 = PCPlus4;
oMemReadData = MemReadData;
oALUResult = ALUResult;
oReadReg1 = ReadReg1;
oHi = Hi;
oLo = Lo;
oHiLoResult = HiLoResult;
oRegDstResult = RegDstResult;
end
end


endmodule
