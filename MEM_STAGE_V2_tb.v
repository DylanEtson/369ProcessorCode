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


module MEM_STAGE_V2_tb();

reg Clk, Reset;

reg cBranch, cPCMux, cMemRead;
reg [1:0] cMemWrite;

reg cMove, cRegWriteCtrl, cRegAddress;
reg [2:0] cMemToReg;
reg [1:0] cSEMux;

reg cZero;

reg [31:0] PCPlus4, PCSumImm, ALUResult, Hi, Lo, ReadReg1, ReadReg2;
reg [63:0] HiLoResult;
reg [4:0] RegDstResult;

wire ocMove, ocRegWriteCtrl, ocRegAddress;
wire [2:0] ocMemToReg;
wire [1:0] ocSEMux;

wire ocZero;

wire [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
wire [63:0] oHiLoResult;
wire [4:0] oRegDstResult;

wire ocPCSrc;
wire [31:0] oPCSumImm, oReadReg1IF;

MEM_STAGE_V2 MEM_TB(Clk, Reset,
                    cBranch, cPCMux, cMemWrite, cMemRead,
                    cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                    cZero,
                    PCPlus4, PCSumImm, HiLoResult, ALUResult, Hi, Lo,
                    ReadReg1, ReadReg2, RegDstResult,
                    
                    ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                    ocZero,
                    oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                    oRegDstResult, oReadReg1,
                    
                    ocPCSrc, oPCSumImm, oReadReg1IF);
                    
initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
Reset = 0;
cBranch = 0;
cPCMux = 0;
cMemWrite = 0;
cMemRead = 0;

cMove = 0;
cRegWriteCtrl = 0; 
cMemToReg = 0;
cSEMux = 0;
cRegAddress = 0;

cZero = 0;

PCPlus4 = 0;
PCSumImm = 0;
ALUResult = 0;
ReadReg1 = 0; 
ReadReg2 = 0;
Hi = 0;
Lo = 0;
HiLoResult = 0;
RegDstResult = 0;

@(posedge Clk);
cBranch = 1;
cZero = 1;

ALUResult = 32'd5;
cMemRead = 1;

end

endmodule
