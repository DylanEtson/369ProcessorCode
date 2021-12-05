`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 03:24:39 PM
// Design Name: 
// Module Name: WindowMemory_C
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


module WindowMemory_C(o00, o01, o02, o03,
                      o10, o11, o12, o13,
                      o20, o21, o22, o23,
                      o30, o31, o32, o33);
                      
output [31:0]         o00, o01, o02, o03,
                      o10, o11, o12, o13,
                      o20, o21, o22, o23,
                      o30, o31, o32, o33;

reg [31:0] memory [0:15];
integer i;

wire a0 = 4'd0;
wire a1 = 4'd1;
wire a2 = 4'd2;
wire a3 = 4'd3;
wire a4 = 4'd4;
wire a5 = 4'd5;
wire a6 = 4'd6;
wire a7 = 4'd7;
wire a8 = 4'd8;
wire a9 = 4'd9;
wire a10 = 4'd10;
wire a11 = 4'd11;
wire a12 = 4'd12;
wire a13 = 4'd13;
wire a14 = 4'd14;
wire a15 = 4'd15;


initial begin
    for (i = 0; i < 16; i = i + 1) begin
        memory[i] = 32'd0;
      
    end
    
    // INITIALIZE MEMORY HERE!
    (* mark_debug = "true" *)$readmemh("window_memory.mem", memory);
end

assign o00 = memory[a0];
assign o01 = memory[a1];
assign o02 = memory[a2];
assign o03 = memory[a3];
assign o10 = memory[a4];
assign o11 = memory[a5];
assign o12 = memory[a6];
assign o13 = memory[a7];
assign o20 = memory[a8];
assign o21 = memory[a9];
assign o22 = memory[a10];
assign o23 = memory[a11];
assign o30 = memory[a12];
assign o31 = memory[a13];
assign o32 = memory[a14];
assign o33 = memory[a15];

endmodule
