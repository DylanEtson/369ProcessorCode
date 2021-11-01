`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 02:12:03 AM
// Design Name: 
// Module Name: WB_STAGE_V2_tb
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


module EX_STAGE_V2_tb();

reg Clk, Reset;                   
reg [1:0] cALUSrcA, cALUSrcB;
reg cRegDst;
reg [2:0] cHiLoOp;
reg [4:0] cALUCtrl;

reg cBranch, cPCMux, cMemRead;
reg [1:0] cMemWrite;

reg cMove, cRegWriteCtrl, cRegAddress;
reg [2:0] cMemToReg;
reg [1:0] cSEMux;

reg [31:0] PCPlus4, ReadReg1, ReadReg2, SEImm, Hi, Lo;
reg [4:0] I2016, I1511;                   
                   
wire ocBranch, ocPCMux, ocMemRead;
wire [1:0] ocMemWrite;

wire ocMove, ocRegWriteCtrl, ocRegAddress;
wire [2:0] ocMemToReg;
wire [1:0] ocSEMux;

wire ocZero;

wire [31:0] oPCPlus4, oPCSumImm, oALUResult, oHi, oLo, oReadReg1, oReadReg2;
wire [63:0] oHiLoResult;
wire [4:0] oRegDstResult;

EX_STAGE_V2  EX_TB(Clk, Reset,
                   cALUSrcA, cALUSrcB, cRegDst, cHiLoOp, cALUCtrl,
                   cBranch, cPCMux, cMemWrite, cMemRead,
                   cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                   PCPlus4, ReadReg1, ReadReg2, SEImm, I2016, I1511, Hi, Lo,
                   
                   ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                   ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                   ocZero,
                   oPCPlus4, oPCSumImm, oHiLoResult, oALUResult, oHi, oLo,
                   oReadReg1, oReadReg2, oRegDstResult);

initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
Reset = 0;

cALUSrcA = 0;
cALUSrcB = 0; 
cRegDst = 0;
cHiLoOp = 0;
cALUCtrl = 0;

cBranch = 0;
cPCMux = 0;
cMemWrite = 0;
cMemRead = 0;

cMove = 0;
cRegWriteCtrl = 0; 
cMemToReg = 0;
cSEMux = 0;
cRegAddress = 0;

PCPlus4 = 0;
ReadReg1 = 0; 
ReadReg2 = 0;
SEImm = 0;
I2016 = 0;
I1511 = 0;
Hi = 0;
Lo = 0;

@(posedge Clk);
cALUCtrl = 5'd9;
SEImm = 32'd20;
ReadReg2 = 32'd40;
cALUSrcA = 2'd1;
cALUSrcB = 2'd2;
cHiLoOp = 3'd1;

Hi = 32'd1;
Lo = 32'd2;


end






endmodule
