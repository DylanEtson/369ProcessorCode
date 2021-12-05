`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 05:32:39 PM
// Design Name: 
// Module Name: SumReg_C
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

module SumReg_C(cSAD, Input,
                oSum, oRegWrite2Sum);

input cSAD;
input [31:0] Input;

output reg [31:0] oSum;
output reg oRegWrite2Sum;

initial begin
    oSum = 32'd50000;
end

always @(Input) begin
    oRegWrite2Sum = 0;
    if ((Input <= oSum) && (cSAD == 1)) begin
        oSum = Input;
        oRegWrite2Sum = 1;
    end
end

endmodule
