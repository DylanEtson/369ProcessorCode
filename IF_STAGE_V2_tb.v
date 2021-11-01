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


module IF_STAGE_V2_tb();



reg Clk, Reset, cPCSrc, cPCMux;
reg [31:0] PCSumImm, ReadReg1;

wire [31:0] oPCPlus4, oInstruction;

IF_STAGE_V2 IF_TB(Clk, Reset,
                   cPCSrc, cPCMux,
                   ReadReg1, PCSumImm,
                   oPCPlus4, oInstruction);

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
    
    #20;
    Reset = 0;
    
    #20;
    cPCSrc = 1;
    
    #20;
    cPCMux = 1;
    
    #20;
    cPCSrc = 0;
    
    #20;
    cPCMux = 0;
end

endmodule
