`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 10:24:59 PM
// Design Name: 
// Module Name: HazardUnit_C
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


module HazardUnit_C(IDrs, IDrt,
                    EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd,
                    EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite,
                    IDRegWrite2, WBRegWrite2,
                    Cache,
                    PCSrc,
                    
                    PCWrite, IFIDWrite, 
                    IFIDFlush, IDEXFlush,
                    RegWrite2MuxSrc, RegWrite2AddressMux);

input [4:0] IDrs, IDrt;
input [4:0] EXrd, MEMrd, SAD1rd, SAD2rd, SAD3rd;
input EXRegWrite, MEMRegWrite, SAD1RegWrite, SAD2RegWrite, SAD3RegWrite;
input IDRegWrite2, WBRegWrite2;
input [2:0] PCSrc;
input Cache;

output reg PCWrite, IFIDWrite, IFIDFlush, IDEXFlush, RegWrite2MuxSrc, RegWrite2AddressMux;

initial begin
PCWrite = 1;
IFIDWrite = 1;
IFIDFlush = 0;
IDEXFlush = 0;
RegWrite2MuxSrc = 0;
RegWrite2AddressMux = 0;
end

always @(*) begin
    
    if (EXRegWrite == 1 && ((IDrs == EXrd || IDrt == EXrd) && EXrd != 5'd0)) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
    else if (MEMRegWrite == 1 && ((IDrs == MEMrd || IDrt == MEMrd) && MEMrd != 5'd0)) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
    else if (SAD1RegWrite == 1 && ((IDrs == SAD1rd || IDrt == SAD1rd) && SAD1rd != 5'd0)) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
    else if (SAD2RegWrite == 1 && ((IDrs == SAD2rd || IDrt == SAD2rd) && SAD2rd != 5'd0)) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
    else if (SAD3RegWrite == 1 && ((IDrs == SAD3rd || IDrt == SAD3rd) && SAD3rd != 5'd0)) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
    else if (IDRegWrite2 == 1 && WBRegWrite2 == 1) begin
        PCWrite = 0;
        IFIDWrite = 0;
        IDEXFlush = 1;
    end
     else begin
        PCWrite = 1;
        IFIDWrite = 1;
        IDEXFlush = 0;
    end
    
    if (PCWrite == 1 && PCSrc == 3'd1 && Cache == 0) begin
        IFIDFlush = 1;
    end
    else if (PCWrite == 1 && PCSrc == 3'd4 && Cache == 1) begin
        IFIDFlush = 1;
    end
    else if (PCWrite == 1 && (PCSrc == 3'd2 || PCSrc == 3'd3) && Cache == 0) begin
        IFIDFlush = 1;
    end
    else if (PCWrite == 1 && PCSrc == 3'd3) begin
        IFIDFlush = 1;
    end
    else begin
        IFIDFlush = 0;
    end
    
    if (WBRegWrite2 == 1) begin
        RegWrite2MuxSrc = 1;
        RegWrite2AddressMux = 1;
    end
    else begin
        RegWrite2MuxSrc = 0;
        RegWrite2AddressMux = 0;
    end
    
end


endmodule