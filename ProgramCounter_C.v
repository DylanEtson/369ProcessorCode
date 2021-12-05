`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:05:56 AM
// Design Name: 
// Module Name: ProgramCounter_C
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


module ProgramCounter_C(Clk, Reset,
                        cPCWrite, cCache,
                        Address, CacheAddress,
                        
                        oPCResult);

    input Reset, Clk, cPCWrite, cCache;
	input [31:0] Address, CacheAddress;
	
	output reg [31:0] oPCResult;
	
	initial begin
	oPCResult = 32'b0;
	end
	
	always @(posedge Reset or posedge Clk) begin
	   if (Reset) begin
	       oPCResult = 32'b0;
	   end
	   else begin
	       if (cPCWrite == 1) begin
	           if (cCache == 1) begin
	               oPCResult = CacheAddress;
	           end
	           else begin
	               oPCResult = Address;
	           end
	       end
	   end
	end

endmodule
