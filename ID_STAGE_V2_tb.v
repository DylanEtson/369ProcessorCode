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


module ID_STAGE_V2_tb();

reg Clk, Reset;
reg cRegWrite;
reg [31:0] PCPlus4, Instruction, RegWriteData, Hi, Lo;
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


ID_STAGE_V2    IDV2(Clk, Reset,
                   cRegWrite,
                   PCPlus4, Instruction, RegWriteData, RegWriteAddress, Hi, Lo,
                   ocALUSrcA, ocALUSrcB, ocRegDst, ocHiLoOp, ocALUCtrl,
                   ocBranch, ocPCMux, ocMemWrite, ocMemRead,
                   ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                   oPCPlus4, oReadReg1, oReadReg2, oSEImm, oI2016, oI1511, oHi, oLo);

initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
Reset = 0;
cRegWrite = 0;
PCPlus4 = 32'd11;
Instruction = 32'b00000001001010000100000000100000;
RegWriteData = 32'd22;
Hi = 32'd33;
Lo = 32'd44;
RegWriteAddress = 5'd7;

#20;
Instruction = 32'b10001101001010000100000000110000;
end

endmodule
