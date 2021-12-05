`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 12:20:11 PM
// Design Name: 
// Module Name: REG_EX_MEM_C
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


module REG_EX_MEM_C(Clk, Reset,
                    SAD, RegWriteCtrl, Move, MemRead,
                    SEMux, MemWrite, 
                    MemToReg,
                    PCPlus4, Zero, HiLoResult, ALUResult,
                    ReadReg1, ReadReg2, RegDstResult,
                    Hi, Lo,
                    HiLoWrite,
                    
                    oSAD, oRegWriteCtrl, oMove, oMemRead,
                    oSEMux, oMemWrite, 
                    oMemToReg,
                    oPCPlus4, oZero, oHiLoResult, oALUResult,
                    oReadReg1, oReadReg2, oRegDstResult,
                    oHi, oLo,
                    oHiLoWrite);

input Clk, Reset;
input SAD, RegWriteCtrl, Move, MemRead;
input [1:0] SEMux, MemWrite;
input [2:0] MemToReg;
input [31:0] ReadReg1, ReadReg2, PCPlus4, Hi, Lo, ALUResult;
input Zero;
input [4:0] RegDstResult;
input [63:0] HiLoResult;
input HiLoWrite;

output reg oSAD, oRegWriteCtrl, oMove, oMemRead;
output reg [1:0] oSEMux, oMemWrite;
output reg [2:0] oMemToReg;
output reg [31:0] oReadReg1, oReadReg2, oPCPlus4, oHi, oLo, oALUResult;
output reg oZero;
output reg [4:0] oRegDstResult;
output reg [63:0] oHiLoResult;
output reg oHiLoWrite;

initial begin
oSAD = 0;
oRegWriteCtrl = 0; 
oMove = 0;
oMemRead = 0;
oSEMux = 0;
oMemWrite = 0;
oMemToReg = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oPCPlus4 = 0;
oHi = 0;
oLo = 0;
oALUResult = 0;
oZero = 0;
oRegDstResult = 0;
oHiLoResult = 0;
oHiLoWrite = 0;
end

always @(posedge Clk) begin

    if (Reset == 1) begin
    oSAD = 0;
oRegWriteCtrl = 0; 
oMove = 0;
oMemRead = 0;
oSEMux = 0;
oMemWrite = 0;
oMemToReg = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oPCPlus4 = 0;
oHi = 0;
oLo = 0;
oALUResult = 0;
oZero = 0;
oRegDstResult = 0;
oHiLoResult = 0;
oHiLoWrite = 0;
    end
    else begin
oSAD = SAD;
oRegWriteCtrl = RegWriteCtrl; 
oMove = Move;
oMemRead = MemRead;
oSEMux = SEMux;
oMemWrite = MemWrite;
oMemToReg = MemToReg;
oReadReg1 = ReadReg1;
oReadReg2 = ReadReg2;
oPCPlus4 = PCPlus4;
oHi = Hi;
oLo = Lo;
oALUResult = ALUResult;
oZero = Zero;
oRegDstResult = RegDstResult;
oHiLoResult = HiLoResult;
oHiLoWrite = HiLoWrite;
    end


end

endmodule
