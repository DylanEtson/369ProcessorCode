`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 05:27:16 AM
// Design Name: 
// Module Name: IF_ID_COMBO
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


module IF_ID_COMBO_V2_tb();

reg Clk, Reset, cPCSrc, cPCMux;
reg [31:0] PCSumImm, ReadReg1;

reg cRegWrite;
reg [31:0] RegWriteData, Hi, Lo;
reg [4:0] RegWriteAddress;

wire [1:0] ocALUSrcA, ocALUSrcB;
wire ocRegDst;
wire [2:0] ocHiLoOp;
wire [4:0] ocALUCtrl;

wire ocBranch, ocPCMux, ocMemRead;
wire [1:0] ocMemWrite;

wire ocMove, ocRegWriteCtrl, ocRegAddress;
wire [2:0] ocMemToReg;
wire [1:0] ocSEMux;

wire [31:0] oPCPlus4, oReadReg1, oReadReg2, oSEImm, oHi, oLo;
wire [4:0] oI2016, oI1511;



IF_ID_COMBO_V2  IF_ID(Clk, Reset,
                      cPCSrc, cPCMux,
                      ReadReg1, PCSumImm,
                      cRegWrite,
                      RegWriteData, RegWriteAddress, Hi, Lo, HiLoWrite,
                      ocALUSrcA, ocALUSrcB, ocRegDst, ocHiLoOp, ocALUCtrl, ocJump,
                      ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                      ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                      oPCPlus4, oReadReg1, oReadReg2, oSEImm, oSEImm2, oI2016, oI1511, oHi, oLo,
                      oPC);
                      
                      
initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
    Reset = 1;
    cPCSrc = 0;
    cPCMux = 0;
    ReadReg1 = 32'd47;
    PCSumImm = 32'd21;
    cRegWrite = 0;
    RegWriteData = 32'd22;
    Hi = 32'd33;
    Lo = 32'd44;
    RegWriteAddress = 5'd7;
    
    #15;
    Reset = 0;
    
    
    
    
    
end

endmodule
