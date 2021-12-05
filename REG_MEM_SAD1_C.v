`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 01:05:25 PM
// Design Name: 
// Module Name: REG_MEM_SAD1_C
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


module REG_MEM_SAD1_C(Clk, Reset,
                  SAD, RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  MemReadData,
                  a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B,
                  
                  oSAD, oRegWriteCtrl, oMove,
                  oSEMux, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oMemReadData,
                  o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B);

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
input [31:0] a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B;

output reg oSAD, oRegWriteCtrl, oMove;
output reg [1:0] oSEMux;
output reg [2:0] oMemToReg;
output reg [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output reg oZero;
output reg [4:0] oRegDstResult;
output reg [63:0] oHiLoResult;
output reg oHiLoWrite;
output reg [31:0] oMemReadData;
output reg [31:0] o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B;

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
o0A = 0;
o0B = 0;
o1A = 0;
o1B = 0;
o2A = 0;
o2B = 0;
o3A = 0;
o3B = 0;
o4A = 0;
o4B = 0;
o5A = 0;
o5B = 0;
o6A = 0;
o6B = 0;
o7A = 0;
o7B = 0;
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
o0A = 0;
o0B = 0;
o1A = 0;
o1B = 0;
o2A = 0;
o2B = 0;
o3A = 0;
o3B = 0;
o4A = 0;
o4B = 0;
o5A = 0;
o5B = 0;
o6A = 0;
o6B = 0;
o7A = 0;
o7B = 0;
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
o0A = a0A;
o0B = a0B;
o1A = a1A;
o1B = a1B;
o2A = a2A;
o2B = a2B;
o3A = a3A;
o3B = a3B;
o4A = a4A;
o4B = a4B;
o5A = a5A;
o5B = a5B;
o6A = a6A;
o6B = a6B;
o7A = a7A;
o7B = a7B;
end
end

endmodule
