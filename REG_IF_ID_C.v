`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:39:47 AM
// Design Name: 
// Module Name: REG_IF_ID_C
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


module REG_IF_ID_C(Clk, Reset,
                   cWrite, cFlush,
                   PCPlus4, Instruction,
                   Cache,
                   
                   oPCPlus4, oInstruction,
                   oCache);
                    
input Clk, Reset, cWrite, cFlush;
input [31:0] PCPlus4, Instruction;
input Cache;

output reg [31:0] oPCPlus4, oInstruction;
output reg oCache;

initial begin
    oPCPlus4 = 32'b0;
    oInstruction = 32'b0;    
    oCache = 32'b0;   
end          
         
always @(posedge Clk) begin
    if (Reset == 1 || cFlush == 1) begin
    oPCPlus4 = 32'b0;
    oInstruction = 32'b0;   
    oCache = 32'b0;   
    end
    else begin
        if (cWrite == 1) begin
            oPCPlus4 = PCPlus4;
            oInstruction = Instruction;
            oCache = Cache;
        end
    end
end         
                       
endmodule
