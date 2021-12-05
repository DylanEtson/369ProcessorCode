`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 07:56:38 PM
// Design Name: 
// Module Name: REG_SAD1_SAD2_C
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


module REG_SAD3_WB_C(Clk, Reset,
                  RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  MemReadData,
                  RegWrite2WB,
                  
                  oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oRegWrite2WB);

input Clk, Reset;
input RegWriteCtrl, Move;
input [1:0] SEMux;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;
input [31:0] MemReadData;
input RegWrite2WB;

output reg oRegWriteCtrl, oMove;
output reg [1:0] oSEMux;
output reg [2:0] oMemToReg;
output reg [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output reg oZero;
output reg [4:0] oRegDstResult;
output reg [63:0] oHiLoResult;
output reg oHiLoWrite;
output reg [31:0] oMemReadData;
output reg oRegWrite2WB;

initial begin
oRegWriteCtrl = 0; 
oMove = 0;
oSEMux = 0;
oMemToReg = 0;
oPCPlus4 = 0;
oALUResult = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oHi = 0;
oLo = 0;
oZero = 0;
oRegDstResult = 0;
oHiLoResult = 0;
oHiLoWrite = 0;
oMemReadData = 0;
oRegWrite2WB = 0;
end

always @(posedge Clk) begin
if (Reset == 1) begin
oRegWriteCtrl = 0; 
oMove = 0;
oSEMux = 0;
oMemToReg = 0;
oPCPlus4 = 0;
oALUResult = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oHi = 0;
oLo = 0;
oZero = 0;
oRegDstResult = 0;
oHiLoResult = 0;
oHiLoWrite = 0;
oMemReadData = 0;
oRegWrite2WB = 0;
end
else begin
oRegWriteCtrl = RegWriteCtrl; 
oMove = Move;
oSEMux = SEMux;
oMemToReg = MemToReg;
oPCPlus4 = PCPlus4;
oALUResult = ALUResult;
oReadReg1 = ReadReg1;
oReadReg2 = ReadReg2;
oHi = Hi;
oLo = Lo;
oZero = Zero;
oRegDstResult = RegDstResult;
oHiLoResult = HiLoResult;
oHiLoWrite = HiLoWrite;
oMemReadData = MemReadData;
oRegWrite2WB = RegWrite2WB;
end
end

endmodule

