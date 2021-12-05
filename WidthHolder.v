`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 01:21:23 PM
// Design Name: 
// Module Name: WidthHolder
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


module WidthHolder(oWidth);

reg [31:0] memory [0:1];
integer i;
wire zero = 0;

output [31:0] oWidth;

initial begin
    for (i = 0; i < 2; i = i + 1) begin
        memory[i] = 32'd0;
    end
    (* mark_debug = "true" *)$readmemh("data_memory.mem", memory);
end

assign oWidth = memory[zero];

endmodule
