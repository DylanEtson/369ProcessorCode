`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 11:30:14 AM
// Design Name: 
// Module Name: InstructionMemory_C
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


module InstructionMemory_C(Address,
                           oInstruction);


    input [31:0] Address;        // Input Address
    
    output [31:0] oInstruction;    // Instruction at memory location Address
   
    reg [31:0] memory [0:1023]; //Local memory. 1024 words.
    
    integer i;
    
    initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            memory[i] = 0;
        end
        (* mark_debug = "true" *)$readmemh("instruction_memory.mem",memory);
    end
   
    assign oInstruction = memory[Address[11:2]];
   
 
endmodule
