`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 12:18:37 PM
// Design Name: 
// Module Name: EX_STAGE_C
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


module EX_STAGE_C(Clk, Reset,
                  SAD, RegWriteCtrl, Move, MemRead,
                  RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite, 
                  MemToReg, HiLoOp, 
                  ALUCtrl,
                  ReadReg1, ReadReg2, PCPlus4, SEImm, Hi, Lo,
                  I2016, I1511,
                  
                  oSAD, oRegWriteCtrl, oMove, oMemRead,
                  oSEMux, oMemWrite, 
                  oMemToReg,
                  oPCPlus4, oZero, oHiLoResult, oALUResult,
                  oReadReg1, oReadReg2, oRegDstResult,
                  oHi, oLo,
                  oHiLoWrite,
                  oEXrd);

input Clk, Reset;
input SAD, RegWriteCtrl, Move, MemRead;
input [1:0] RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite; 
input [2:0] MemToReg, HiLoOp;
input [4:0] ALUCtrl;
input [31:0] ReadReg1, ReadReg2, PCPlus4, SEImm, Hi, Lo;
input [4:0] I2016, I1511;

output oSAD, oRegWriteCtrl, oMove, oMemRead;
output [1:0] oSEMux, oMemWrite;
output [2:0] oMemToReg;
output [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
output oZero;
output [4:0] oRegDstResult;
output [63:0] oHiLoResult;
output oHiLoWrite;

output [4:0] oEXrd;
wire [4:0] wRegDstResult;
wire wZero, wHiLoWrite;
wire [31:0] wSEImmShifted, wALUInputA, wALUInputB;
wire [63:0] wHiLoResult, wALUResult;

assign oEXrd = wRegDstResult;

ShiftLeft_16_C shifter(SEImm, wSEImmShifted);

Mux_32Bit_4To1_C ALUSrcAMux(ReadReg1, ReadReg2, 32'd0, ReadReg1, ALUSrcA, wALUInputA);
Mux_32Bit_4To1_C ALUSrcBMux(ReadReg2, SEImm, wSEImmShifted, 32'd0, ALUSrcB, wALUInputB);

ALU_C ALU(wALUInputA, wALUInputB,
          ALUCtrl,
          wALUResult, wZero);
          
HiLoALU_C hiLo(wALUResult, {Hi, Lo}, HiLoOp, wHiLoResult, wHiLoWrite);
    
Mux_32Bit_4To1_C RegDstMux(I2016, I1511, 5'd2, I2016, RegDst, wRegDstResult);         
                    
REG_EX_MEM_C register(Clk, Reset,
                    SAD, RegWriteCtrl, Move, MemRead,
                    SEMux, MemWrite, 
                    MemToReg,
                    PCPlus4, wZero, wHiLoResult, wALUResult[31:0],
                    ReadReg1, ReadReg2, wRegDstResult,
                    Hi, Lo,
                    wHiLoWrite,
                    
                    oSAD, oRegWriteCtrl, oMove, oMemRead,
                    oSEMux, oMemWrite, 
                    oMemToReg,
                    oPCPlus4, oZero, oHiLoResult, oALUResult,
                    oReadReg1, oReadReg2, oRegDstResult,
                    oHi, oLo,
                    oHiLoWrite);

endmodule
