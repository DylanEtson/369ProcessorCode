`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:02:51 PM
// Design Name: 
// Module Name: SignExtend_16to32_C
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


module SignExtend_16to32_C(in,
                           out);
                           
    input [15:0] in;

    output [31:0] out;

    assign out = { {16{in[15]}}, in};
                           
                           
endmodule
