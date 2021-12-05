`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:52:31 PM
// Design Name: 
// Module Name: AbsDiff_16x2To16_C
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


module AbsDiff_16x2To16_C(A1, A2,
                          B1, B2,
                          C1, C2,
                          D1, D2,
                          E1, E2,
                          F1, F2,
                          G1, G2,
                          H1, H2,
                          I1, I2,
                          J1, J2,
                          K1, K2,
                          L1, L2,
                          M1, M2,
                          N1, N2,
                          O1, O2,
                          P1, P2,
                          
                          oA,
                          oB,
                          oC,
                          oD,
                          oE,
                          oF,
                          oG,
                          oH,
                          oI,
                          oJ,
                          oK,
                          oL,
                          oM,
                          oN,
                          oO,
                          oP);

input [31:0]              A1, A2,
                          B1, B2,
                          C1, C2,
                          D1, D2,
                          E1, E2,
                          F1, F2,
                          G1, G2,
                          H1, H2,
                          I1, I2,
                          J1, J2,
                          K1, K2,
                          L1, L2,
                          M1, M2,
                          N1, N2,
                          O1, O2,
                          P1, P2;

output [31:0]             oA,
                          oB,
                          oC,
                          oD,
                          oE,
                          oF,
                          oG,
                          oH,
                          oI,
                          oJ,
                          oK,
                          oL,
                          oM,
                          oN,
                          oO,
                          oP;

AbsDiff_C A(A1, A2, oA);
AbsDiff_C B(B1, B2, oB);
AbsDiff_C C(C1, C2, oC);
AbsDiff_C D(D1, D2, oD);
AbsDiff_C E(E1, E2, oE);
AbsDiff_C F(F1, F2, oF);
AbsDiff_C G(G1, G2, oG);
AbsDiff_C H(H1, H2, oH);
AbsDiff_C I(I1, I2, oI);
AbsDiff_C J(J1, J2, oJ);
AbsDiff_C K(K1, K2, oK);
AbsDiff_C L(L1, L2, oL);
AbsDiff_C M(M1, M2, oM);
AbsDiff_C N(N1, N2, oN);
AbsDiff_C O(O1, O2, oO);
AbsDiff_C P(P1, P2, oP);

endmodule
