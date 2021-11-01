`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// ECE 369 
// Group 4
//
// Noah Butler / Colin Herbert / Dylan Etson
// 33%         / 33%           / 33%
//
// Top Level Testbench
// lab4_source_tb.v
//
//////////////////////////////////////////////////////////////////////////////////


module lab4_source_tb();

reg Clk, Reset;
wire [6:0] out7;
wire [7:0] en_out;

lab4_source lab4_tb(Clk, Reset, out7, en_out);

initial begin
    Clk <= 1'b1;
    forever #10 Clk <= ~Clk;
end

initial begin
    Reset = 1;
    #15;
    Reset = 0;
end


endmodule
