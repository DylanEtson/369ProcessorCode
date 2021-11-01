`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 02:25:08 AM
// Design Name: 
// Module Name: ID_EX_REG_V2
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


module ID_EX_REG_V2(Clk, Reset,
                    cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl, cJump,
                    cBranch, cPCMux, cMemWrite, cMemRead, 
                    cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                    PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, I2016, I1511, Hi, Lo,
                    
                    ocALUSrcA, ocALUSrcB, ocRegDst, ocHiLoOp, ocALUCtrl, ocJump,
                    ocBranch, ocPCMux, ocMemWrite, ocMemRead, 
                    ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                    oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oI2016, oI1511, oHi, oLo);

input Clk, Reset;

input [1:0] cALUSrcA, cALUSrcB;
input cRegDst, cJump;
input [2:0] cHiLoOp;
input [4:0] cALUCtrl;

input cBranch, cPCMux, cMemRead;
input [1:0] cMemWrite;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input [31:0] PCPlus4, ReadReg1, ReadReg2, SEImm, SEImm2, Hi, Lo;
input [4:0] I2016, I1511;

output reg [1:0] ocALUSrcA, ocALUSrcB;
output reg ocRegDst, ocJump;
output reg [2:0] ocHiLoOp;
output reg [4:0] ocALUCtrl;

output reg ocBranch, ocPCMux, ocMemRead;
output reg [1:0] ocMemWrite;

output reg ocMove, ocRegWriteCtrl, ocRegAddress;
output reg [2:0] ocMemToReg;
output reg [1:0] ocSEMux;

output reg [31:0] oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oHi, oLo;
output reg [4:0] oI2016, oI1511;

initial begin
ocALUSrcA = 0;
ocALUSrcB = 0; 
ocRegDst = 0;
ocHiLoOp = 0;
ocALUCtrl = 0;
ocJump = 0;

ocBranch = 0;
ocPCMux = 0;
ocMemWrite = 0;
ocMemRead = 0;

ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

oPCPlus4 = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oSEImm = 0;
oSEImm2 = 0;
oI2016 = 0;
oI1511 = 0;
oHi = 0;
oLo = 0;
end

always @(posedge Clk) begin
if (Reset == 1) begin
ocALUSrcA = 0;
ocALUSrcB = 0; 
ocRegDst = 0;
ocHiLoOp = 0;
ocALUCtrl = 0;
ocJump = 0;

ocBranch = 0;
ocPCMux = 0;
ocMemWrite = 0;
ocMemRead = 0;

ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

oPCPlus4 = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oSEImm = 0;
oSEImm2 = 0;
oI2016 = 0;
oI1511 = 0;
oHi = 0;
oLo = 0;
end
else begin
ocALUSrcA = cALUSrcA;
ocALUSrcB = cALUSrcB;
ocRegDst = cRegDst;
ocHiLoOp = cHiLoOp;
ocALUCtrl = cALUCtrl;
ocJump = cJump;

ocBranch = cBranch;
ocPCMux = cPCMux;
ocMemWrite = cMemWrite;
ocMemRead = cMemRead;

ocMove = cMove;
ocRegWriteCtrl = cRegWriteCtrl; 
ocMemToReg = cMemToReg;
ocSEMux = cSEMux;
ocRegAddress = cRegAddress;

oPCPlus4 = PCPlus4;
oReadReg1 = ReadReg1;
oReadReg2 = ReadReg2;
oSEImm = SEImm;
oSEImm2 = SEImm2;
oI2016 = I2016;
oI1511 = I1511;
oHi = Hi;
oLo = Lo;
end
end


endmodule