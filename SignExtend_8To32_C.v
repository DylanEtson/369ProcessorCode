`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:22:03 PM
// Design Name: 
// Module Name: SignExtend_8To32_C
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


module SignExtend_8To32_C(in,
                          out);
                           
    input [7:0] in;

    output [31:0] out;

    assign out = { {24{in[7]}}, in};
                           
                           
endmodule