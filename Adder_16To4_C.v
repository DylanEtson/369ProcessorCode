`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:59:31 PM
// Design Name: 
// Module Name: Adder_16To4_C
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


module Adder_16To4_C(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P,
                     oA2, oB2, oC2, oD2);
                     
input [31:0] A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;      
output [31:0] oA2, oB2, oC2, oD2;

wire [31:0] wAB, wCD, wEF, wGH, wIJ, wKL, wMN, wOP;

Adder_32Bit_C AB(A, B, wAB);
Adder_32Bit_C CD(C, D, wCD); 
Adder_32Bit_C EF(E, F, wEF); 
Adder_32Bit_C GH(G, H, wGH); 
Adder_32Bit_C IJ(I, J, wIJ); 
Adder_32Bit_C KL(K, L, wKL); 
Adder_32Bit_C MN(M, N, wMN); 
Adder_32Bit_C OP(O, P, wOP); 

Adder_32Bit_C ABCD(wAB, wCD, oA2);
Adder_32Bit_C EFGH(wEF, wGH, oB2);
Adder_32Bit_C IJKL(wIJ, wKL, oC2);
Adder_32Bit_C MNOP(wMN, wOP, oD2);
            
endmodule
