`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:59:52 PM
// Design Name: 
// Module Name: BigMemory_C
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


module BigMemory_C(Address, cMemRead,
                   o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B);

    input cMemRead;
    input [31:0] Address;

    output [31:0]  o0A, o0B,
                   o1A, o1B,
                   o2A, o2B,
                   o3A, o3B,
                   o4A, o4B,
                   o5A, o5B,
                   o6A, o6B,
                   o7A, o7B;
                   
    BigMemory_Fragment_C fragment0(3'd0, cMemRead, Address, o0A, o0B);
    BigMemory_Fragment_C fragment1(3'd1, cMemRead, Address, o1A, o1B);
    BigMemory_Fragment_C fragment2(3'd2, cMemRead, Address, o2A, o2B);
    BigMemory_Fragment_C fragment3(3'd3, cMemRead, Address, o3A, o3B);
    BigMemory_Fragment_C fragment4(3'd4, cMemRead, Address, o4A, o4B);
    BigMemory_Fragment_C fragment5(3'd5, cMemRead, Address, o5A, o5B);
    BigMemory_Fragment_C fragment6(3'd6, cMemRead, Address, o6A, o6B);
    BigMemory_Fragment_C fragment7(3'd7, cMemRead, Address, o7A, o7B);
    
endmodule
