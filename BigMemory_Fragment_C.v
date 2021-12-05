`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:48:58 PM
// Design Name: 
// Module Name: BigMemory_Fragment_C
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


module BigMemory_Fragment_C(cFragmentPiece, cMemRead,
                            Address, 
                            oReadData1, oReadData2);

input cMemRead;
input [2:0] cFragmentPiece;
input [31:0] Address;
output [31:0] oReadData1, oReadData2;

reg [31:0] memory [0:3719];

integer i;

initial begin 
    for (i = 0; i < 3800; i = i + 1) begin
        memory[i] = 32'd0;
    end
    
    case (cFragmentPiece)
        3'd0: begin
            (* mark_debug = "true" *)$readmemh("big_memory_0.mem", memory);
        end
        3'd1: begin
            (* mark_debug = "true" *)$readmemh("big_memory_1.mem", memory);
        end
        3'd2: begin
            (* mark_debug = "true" *)$readmemh("big_memory_2.mem", memory);
        end
        3'd3: begin
            (* mark_debug = "true" *)$readmemh("big_memory_3.mem", memory);
        end
        3'd4: begin
            (* mark_debug = "true" *)$readmemh("big_memory_4.mem", memory);
        end
        3'd5: begin
            (* mark_debug = "true" *)$readmemh("big_memory_5.mem", memory);
        end
        3'd6: begin
            (* mark_debug = "true" *)$readmemh("big_memory_6.mem", memory);
        end
        3'd7: begin
            (* mark_debug = "true" *)$readmemh("big_memory_7.mem", memory);
        end
    endcase
end

assign oReadData1 = (cMemRead == 1) ? memory[Address[13:2]] :
                    32'd0;
assign oReadData2 = (cMemRead == 1) ? memory[Address[13:2] + 32'd1] :
                    32'd0;

endmodule