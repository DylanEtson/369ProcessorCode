`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 12:27:06 AM
// Design Name: 
// Module Name: REG_ID_EX_C
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


module REG_ID_EX_C(Clk, Reset,
                   cFlush,
                   SAD, RegWriteCtrl, Move, MemRead,
                   RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite, 
                   MemToReg, HiLoOp, 
                   ALUCtrl,
                   ReadReg1, ReadReg2, PCPlus4, SEImm, Hi, Lo,
                   I2016, I1511,
                   
                   oSAD, oRegWriteCtrl, oMove, oMemRead,
                   oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite, 
                   oMemToReg, oHiLoOp, 
                   oALUCtrl,
                   oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo,
                   oI2016, oI1511);

input Clk, Reset, cFlush;
input SAD, RegWriteCtrl, Move, MemRead;
input [1:0] RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite;
input [2:0] MemToReg, HiLoOp;
input [4:0] ALUCtrl;
input [31:0] ReadReg1, ReadReg2, PCPlus4, SEImm, Hi, Lo;
input [4:0] I2016, I1511;

output reg oSAD, oRegWriteCtrl, oMove, oMemRead;
output reg [1:0] oRegDst, oSEMux, oALUSrcA, oALUSrcB, oMemWrite;
output reg [2:0] oMemToReg, oHiLoOp;
output reg [4:0] oALUCtrl;
output reg [31:0] oReadReg1, oReadReg2, oPCPlus4, oSEImm, oHi, oLo;
output reg [4:0] oI2016, oI1511;

initial begin
oSAD = 0;
oRegWriteCtrl = 0; 
oMove = 0;
oMemRead = 0;
oRegDst = 0;
oSEMux = 0;
oALUSrcA = 0; 
oALUSrcB = 0;
oMemWrite = 0;
oMemToReg = 0;
oHiLoOp = 0;
oALUCtrl = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oPCPlus4 = 0;
oSEImm = 0;
oHi = 0;
oLo = 0;
oI2016 = 0; 
oI1511 = 0;
end

always @ (posedge Clk) begin
    if (Reset == 1 || cFlush == 1) begin
    oSAD = 0;
oRegWriteCtrl = 0; 
oMove = 0;
oMemRead = 0;
oRegDst = 0;
oSEMux = 0;
oALUSrcA = 0; 
oALUSrcB = 0;
oMemWrite = 0;
oMemToReg = 0;
oHiLoOp = 0;
oALUCtrl = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oPCPlus4 = 0;
oSEImm = 0;
oHi = 0;
oLo = 0;
oI2016 = 0; 
oI1511 = 0;
    end
    else begin
        oSAD = SAD; 
oRegWriteCtrl =  RegWriteCtrl;
oMove = Move;
oMemRead = MemRead;
oRegDst = RegDst;
oSEMux = SEMux;
oALUSrcA =  ALUSrcA;
oALUSrcB = ALUSrcB;
oMemWrite = MemWrite;
oMemToReg = MemToReg;
oHiLoOp = HiLoOp;
oALUCtrl = ALUCtrl;
oReadReg1 = ReadReg1;
oReadReg2 = ReadReg2;
oPCPlus4 = PCPlus4;
oSEImm = SEImm;
oHi = Hi;
oLo = Lo;
oI2016 = I2016; 
oI1511 = I1511;
    end
end

endmodule
