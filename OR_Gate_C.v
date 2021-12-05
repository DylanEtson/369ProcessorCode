`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:08:27 PM
// Design Name: 
// Module Name: OR_Gate_C
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


module OR_Gate_C(Input1, Input2, Output);
    input Input1;
    input Input2;
    output Output;
    
    assign Output = Input1 | Input2;

endmodule
