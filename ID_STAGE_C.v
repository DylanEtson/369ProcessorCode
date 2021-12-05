`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 09:16:35 PM
// Design Name: 
// Module Name: ID_STAGE_C
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


module ID_STAGE_C(Clk, Reset,
                  PCPlus4, Instruction,
                  newHi, newLo, HiLoWrite,
                  RegWrite2WB,
                  cRegWrite1, RegWriteAddress1, WriteData1,
                  ReadReg2WB,
                  Cache,
                  EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                  EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,

                  oSAD, oRegWriteCtrl, oMove, oMemRead,
                  oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite, 
                  oMemToReg, oHiLoOp, 
                  oALUCtrl,
                  oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo,
                  oI2016, oI1511,
                  oSEImm26ToIF, oReadReg1ToIF, oPCPlus4ToIF, oPCSumImmToIF,
                  oPCSrc,
                  oPCWrite, oIFIDWrite,
                  oIFIDFlush,
                  oV0, oV1);

input Clk, Reset;
input [31:0] PCPlus4, Instruction;
input [31:0] newHi, newLo;
input RegWrite2WB, cRegWrite1;
input [4:0] RegWriteAddress1;
input [31:0] WriteData1, ReadReg2WB;
input HiLoWrite;
input Cache;
input [4:0] EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd;
input EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite;

output oSAD, oRegWriteCtrl, oMove, oMemRead;
output [1:0] oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite; 
output [2:0] oMemToReg, oHiLoOp;
output [4:0] oALUCtrl;
output [31:0] oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo;
output [4:0] oI2016, oI1511;
output [2:0] oPCSrc;
output oPCWrite, oIFIDWrite, oIFIDFlush;

output [31:0] oSEImm26ToIF, oReadReg1ToIF, oPCPlus4ToIF, oPCSumImmToIF;
output [31:0] oV0, oV1;

wire SAD, RegWriteCtrl, Move, MemRead;
wire [1:0] RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite; 
wire [2:0] MemToReg, HiLoOp;
wire [4:0] ALUCtrl;
wire wcFlush, wRegWrite2;
wire [31:0] wReadReg1, wReadReg2, wSEImm, wSEImm26;
wire [31:0] wSEImmShifted, wWriteData2, wHi, wLo;
wire [4:0] wRegWriteAddress2;
wire wRegWrite2BC, wRegWrite2SrcMux, wRegWriteAddress2Src;

assign oPCPlus4ToIF = PCPlus4;
assign oReadReg1ToIF = wReadReg1;

// Good
Controller_C controller(Instruction,
                        SAD, RegWriteCtrl, Move, MemRead,
                        RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite, 
                        MemToReg, HiLoOp, 
                        ALUCtrl);

// Good
RegFile_C regFile(Clk, 
                 cRegWrite1, wRegWrite2,
                 Instruction[25:21], Instruction[20:16],
                 RegWriteAddress1, wRegWriteAddress2,
                 WriteData1, wWriteData2,
                 
                 wReadReg1, wReadReg2,
                 oV0, oV1);

// Good
BranchDecoder_C branch(Clk, Instruction, Instruction[16], wReadReg1, wReadReg2, Cache,
                       oPCSrc, wRegWrite2BC);

// Good
HazardUnit_C hazard(Instruction[25:21], Instruction[20:16],
                    EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                    EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,
                    wRegWrite2BC, RegWrite2WB, 
                    Cache,
                    oPCSrc,
                    
                    oPCWrite, oIFIDWrite,
                    oIFIDFlush, wcFlush,
                    wRegWrite2SrcMux, wRegWriteAddress2Src);

// Good
Mux_32Bit_2To1_C RegWriteData2Mux(PCPlus4, ReadReg2WB, wRegWrite2SrcMux, wWriteData2);
Mux_32Bit_2To1_C RegWriteAddress2Mux(5'd31, 5'd3, wRegWriteAddress2Src, wRegWriteAddress2);

// Good
Mux_32Bit_2To1_C HiMux(oHi, newHi, HiLoWrite, wHi);
Mux_32Bit_2To1_C LoMux(oLo, newLo, HiLoWrite, wLo);

// Good
OR_Gate_C regWrite2Gate(wRegWrite2BC, RegWrite2WB, wRegWrite2);

// Good
SignExtend_16to32_C se16(Instruction[15:0], wSEImm);
SignExtend_26To32_C se26(Instruction[25:0], wSEImm26);

// Good
ShiftLeft_2_C se16shifter(wSEImm, wSEImmShifted);
ShiftLeft_2_C se26shifter(wSEImm26, oSEImm26ToIF);

// Good
Adder_32Bit_C seImmAdder(PCPlus4, wSEImmShifted, oPCSumImmToIF);

// Good
REG_ID_EX_C register(Clk, Reset,
                     wcFlush,
                     SAD, RegWriteCtrl, Move, MemRead,
                     RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite, 
                     MemToReg, HiLoOp, 
                     ALUCtrl,
                     wReadReg1, wReadReg2, PCPlus4, wSEImm, wHi, wLo,
                     Instruction[20:16], Instruction[15:11],
                   
                     oSAD, oRegWriteCtrl, oMove, oMemRead,
                     oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite, 
                     oMemToReg, oHiLoOp, 
                     oALUCtrl,
                     oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo,
                     oI2016, oI1511);

endmodule