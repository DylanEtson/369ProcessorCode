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


module WB_STAGE_V2_tb();

reg Clk, Reset;

reg cMove, cRegWriteCtrl, cRegAddress;
reg [2:0] cMemToReg;
reg [1:0] cSEMux;

reg cZero;

reg [31:0] PCPlus4, MemReadData, ALUResult, Hi, Lo, ReadReg1;
reg [63:0] HiLoResult;
reg [4:0] RegDstResult;

wire ocRegWrite;
wire [4:0] oRegWriteAddress;
wire [31:0] oRegWriteData, oHi, oLo;

WB_STAGE_V2  WB_TB(Clk, Reset,
                   cMove, cRegWriteCtrl, cMemToReg, cSEMux, cRegAddress,
                   cZero,
                   PCPlus4, HiLoResult, MemReadData, ALUResult, Hi, Lo,
                   RegDstResult, ReadReg1,
                   
                   ocRegWrite, 
                   oRegWriteAddress, oRegWriteData, oHi, oLo);

initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
Reset = 0;
cMove = 0;
cRegWriteCtrl = 0; 
cMemToReg = 0;
cSEMux = 0;
cRegAddress = 0;

cZero = 0;

PCPlus4 = 32'd33;
ALUResult = 32'd22;
ReadReg1 = 32'd44;
Hi = 32'd55;
Lo = 32'haabbccdd;
HiLoResult = 0;
RegDstResult = 5'd16;
MemReadData = 32'd11;

@(posedge Clk);
cMove = 1;
cZero = 1;

@(posedge Clk);
cMove = 0;
cZero = 0;
@(posedge Clk);
cRegWriteCtrl = 1;
@(posedge Clk);
cRegAddress = 1;
@(posedge Clk);
cMemToReg = 3'd1;
@(posedge Clk);
cMemToReg = 3'd2;
@(posedge Clk);
cMemToReg = 3'd3;
@(posedge Clk);
cMemToReg = 3'd4;
@(posedge Clk);
cMemToReg = 3'd5;
@(posedge Clk);
cSEMux = 2'd1;
@(posedge Clk);
cSEMux = 2'd2;
end

endmodule
