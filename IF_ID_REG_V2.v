`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 02:01:15 AM
// Design Name: 
// Module Name: IF_ID_REG_V2
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


module IF_ID_REG_V2(Clk, Reset,
                    PCPlus4, Instruction, 
                    oPCPlus4, oInstruction);
                    
input Clk, Reset;
input [31:0] PCPlus4, Instruction;

output reg [31:0] oPCPlus4, oInstruction;

initial begin
    oPCPlus4 = 32'b0;
    oInstruction = 32'b0;       
end          
         
always @(posedge Clk) begin
    if (Reset == 1) begin
    oPCPlus4 = 32'b0;
    oInstruction = 32'b0;   
    end
    else begin
    oPCPlus4 = PCPlus4;
    oInstruction = Instruction;
    end
end         
                       
endmodule
