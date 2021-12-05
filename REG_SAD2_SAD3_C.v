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


module REG_SAD2_SAD3_C(Clk, Reset,
                  SAD, RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  MemReadData,
                  A2, B2, C2, D2,
                  
                  oSAD, oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  oA2, oB2, oC2, oD2);

input Clk, Reset;
input SAD, RegWriteCtrl, Move;
input [1:0] SEMux;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;
input [31:0] MemReadData;
input [31:0] A2, B2, C2, D2;

output reg oSAD, oRegWriteCtrl, oMove;
output reg [1:0] oSEMux;
output reg [2:0] oMemToReg;
output reg [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output reg oZero;
output reg [4:0] oRegDstResult;
output reg [63:0] oHiLoResult;
output reg oHiLoWrite;
output reg [31:0] oMemReadData;
output reg [31:0] oA2, oB2, oC2, oD2;

initial begin
oSAD = 0;
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
oA2 = 0;
oB2 = 0;
oC2 = 0;
oD2 = 0;
end

always @(posedge Clk) begin
if (Reset == 1) begin
oSAD = 0;
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
oA2 = 0;
oB2 = 0;
oC2 = 0;
oD2 = 0;
end
else begin
oSAD = SAD;
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
oA2 = A2;
oB2 = B2;
oC2 = C2;
oD2 = D2;
end
end

endmodule

