`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 12:55:55 PM
// Design Name: 
// Module Name: MEM_STAGE_C
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


module MEM_STAGE_C(Clk, Reset,
                  SAD, RegWriteCtrl, Move, MemRead,
                  SEMux, MemWrite, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  
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
                   o7A, o7B,
                   oMEMrd,
                   oMEMRegWrite);

input Clk, Reset;
input SAD, RegWriteCtrl, Move, MemRead;
input [1:0] SEMux, MemWrite;
input [2:0] MemToReg;
input [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;

output oSAD, oRegWriteCtrl, oMove;
output [1:0] oSEMux;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;
output [31:0] oMemReadData;
output [31:0] o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B;
output [4:0] oMEMrd;
output oMEMRegWrite;

wire [31:0] wMemReadData, wWidth, wWidthMultiplied, wDestination, wDestinationShifted;
wire [31:0] a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B;

assign oMEMrd = RegDstResult;
assign oMEMRegWrite = RegWriteCtrl;

DataMemory_C dataMemory(Clk, 
                        MemWrite, MemRead,
                        ALUResult, ReadReg2, 
                        wMemReadData); 

WidthHolder widthholder(wWidth);

Multiplier_32Bit_C multiplier(wWidth, ReadReg2, wWidthMultiplied);
Adder_32Bit_C adder(wWidthMultiplied, ReadReg1, wDestination);
ShiftLeft_2_C shifter(wDestination, wDestinationShifted);

BigMemory_C bigMEM(wDestinationShifted, SAD,
                   a0A, a0B,
                   a1A, a1B,
                   a2A, a2B,
                   a3A, a3B,
                   a4A, a4B,
                   a5A, a5B,
                   a6A, a6B,
                   a7A, a7B);

REG_MEM_SAD1_C register(Clk, Reset,
                  SAD, RegWriteCtrl, Move,
                  SEMux, 
                  MemToReg,
                  PCPlus4, Zero, HiLoResult, ALUResult,
                  ReadReg1, ReadReg2, RegDstResult,
                  Hi, Lo,
                  HiLoWrite,
                  wMemReadData,
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






endmodule
