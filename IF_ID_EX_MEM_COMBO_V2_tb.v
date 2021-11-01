`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 06:35:20 AM
// Design Name: 
// Module Name: IF_ID_EX_MEM_COMBO_V2_tb
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


module IF_ID_EX_MEM_COMBO_V2_tb();

reg Clk, Reset;

reg cRegWrite;
reg [31:0] RegWriteData, Hi, Lo;
reg [4:0] RegWriteAddress;

wire ocMove, ocRegWriteCtrl, ocRegAddress;
wire [2:0] ocMemToReg;
wire [1:0] ocSEMux;

wire ocZero;

wire [31:0] oPCPlus4, oMemReadData, oALUResult, oHi, oLo, oReadReg1;
wire [63:0] oHiLoResult;
wire [4:0] oRegDstResult;

IF_ID_EX_MEM_COMBO_V2 FDXMEM(Clk, Reset,
                             cRegWrite,
                             RegWriteData, RegWriteAddress, Hi, Lo,
                             ocMove, ocRegWriteCtrl, ocMemToReg, ocSEMux, ocRegAddress,
                             ocZero,
                             oPCPlus4, oHiLoResult, oMemReadData, oALUResult, oHi, oLo,
                             oRegDstResult, oReadReg1);

initial begin
    Clk <= 1'b0;
    forever #10 Clk <= ~Clk;
end

initial begin
    Reset = 1;
    cRegWrite = 0;
    RegWriteData = 32'd22;
    Hi = 32'd33;
    Lo = 32'd44;
    RegWriteAddress = 5'd7;
    
    #15;
    Reset = 0;
    
    
    
    
    
end

endmodule
