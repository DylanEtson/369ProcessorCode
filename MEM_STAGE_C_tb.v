`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 10:25:27 PM
// Design Name: 
// Module Name: MEM_STAGE_C_tb
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


module MEM_STAGE_C_tb();

reg Clk, Reset;
reg SAD, RegWriteCtrl, Move, MemRead;
reg [1:0] SEMux, MemWrite;
reg [2:0] MemToReg;
reg [31:0] PCPlus4, ALUResult, ReadReg1, ReadReg2, Hi, Lo;
reg Zero;
reg [4:0] RegDstResult;
reg [63:0] HiLoResult;
reg HiLoWrite;

wire oSAD, oRegWriteCtrl, oMove;
wire [1:0] oSEMux;
wire [2:0] oMemToReg;
wire [31:0] oPCPlus4, oALUResult, oReadReg1, oReadReg2, oHi, oLo;
wire oZero;
wire [4:0] oRegDstResult;
wire [63:0] oHiLoResult;
wire oHiLoWrite;
wire [31:0] oMemReadData;
wire [31:0] o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B;

MEM_STAGE_C   mem(Clk, Reset,
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
                   o7A, o7B);

initial begin
    Clk <= 1'b1;
    forever #10 Clk <= ~Clk;
end

initial begin
    Reset = 1;
    SAD = 0;
    RegWriteCtrl= 0;
    Move= 0;
    MemRead= 0;
    SEMux= 0;
    MemWrite= 0;
    MemToReg= 0;
    PCPlus4= 0;
    ALUResult= 0;
    ReadReg1= 0;
    ReadReg2= 0;
    Hi= 0;
    Lo= 0;
    Zero= 0;
    RegDstResult= 0;
    HiLoResult= 0;
    HiLoWrite= 0;
  
    #15;
    Reset = 0;
end






endmodule
