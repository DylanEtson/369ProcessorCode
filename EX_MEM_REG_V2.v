`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 03:16:54 AM
// Design Name: 
// Module Name: EX_MEM_REG_V2
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


module EX_MEM_REG_V2(Clk, Reset,
                     cBranch, cPCMux, cMemWrite, cMemRead,
                     cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                     cZero,
                     PCPlus4, PCSumImm, HiLoResult, ALUResult, Hi, Lo,
                     ReadReg1, ReadReg2, RegDstResult,
                     HiLoWrite,
                     
                     ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                     ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                     ocZero,
                     oPCPlus4, oPCSumImm, oHiLoResult, oALUResult, oHi, oLo,
                     oReadReg1, oReadReg2, oRegDstResult,
                     oHiLoWrite);

input Clk, Reset;
   
input cBranch, cPCMux, cMemRead;
input [1:0] cMemWrite;

input cMove, cRegWriteCtrl, cRegAddress;
input [2:0] cMemToReg;
input [1:0] cSEMux;

input cZero, HiLoWrite;

input [31:0] PCPlus4, PCSumImm, ALUResult, Hi, Lo, ReadReg1, ReadReg2;
input [63:0] HiLoResult;
input [4:0] RegDstResult;

output reg ocBranch, ocPCMux, ocMemRead;
output reg [1:0] ocMemWrite;

output reg ocMove, ocRegWriteCtrl, ocRegAddress;
output reg [2:0] ocMemToReg;
output reg [1:0] ocSEMux;

output reg ocZero, oHiLoWrite;

output reg [31:0] oPCPlus4, oPCSumImm, oALUResult, oHi, oLo, oReadReg1, oReadReg2;
output reg [63:0] oHiLoResult;
output reg [4:0] oRegDstResult;
 
               
initial begin
ocBranch = 0;
ocPCMux = 0;
ocMemWrite = 0;
ocMemRead = 0;

ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

ocZero = 0;
oHiLoWrite = 0;

oPCPlus4 = 0;
oPCSumImm = 0;
oALUResult = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oHi = 0;
oLo = 0;
oHiLoResult = 0;
oRegDstResult = 0;
end

always @(posedge Clk) begin
if (Reset == 1) begin
ocBranch = 0;
ocPCMux = 0;
ocMemWrite = 0;
ocMemRead = 0;

ocMove = 0;
ocRegWriteCtrl = 0; 
ocMemToReg = 0;
ocSEMux = 0;
ocRegAddress = 0;

ocZero = 0;
oHiLoWrite = 0;

oPCPlus4 = 0;
oPCSumImm = 0;
oALUResult = 0;
oReadReg1 = 0;
oReadReg2 = 0;
oHi = 0;
oLo = 0;
oHiLoResult = 0;
oRegDstResult = 0;

end
else begin
ocBranch = cBranch;
ocPCMux = cPCMux;
ocMemWrite = cMemWrite;
ocMemRead = cMemRead;

ocMove = cMove;
ocRegWriteCtrl = cRegWriteCtrl; 
ocMemToReg = cMemToReg;
ocSEMux = cSEMux;
ocRegAddress = cRegAddress;

ocZero = cZero;
oHiLoWrite = HiLoWrite;

oPCPlus4 = PCPlus4;
oPCSumImm = PCSumImm;
oALUResult = ALUResult;
oReadReg1 = ReadReg1;
oReadReg2 = ReadReg2;
oHi = Hi;
oLo = Lo;
oHiLoResult = HiLoResult;
oRegDstResult = RegDstResult;
end
end                
                     
                     
                     
endmodule
