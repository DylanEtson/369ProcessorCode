`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:51:22 PM
// Design Name: 
// Module Name: DataMemory_C
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


module DataMemory_C(Clk, 
                    MemWrite, MemRead,
                    Address, WriteData, 
                    ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input [1:0] MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output [31:0] ReadData; // Contents of memory location at Address

    
    
    reg [31:0] memory [0:4199]; //Local memory. 4200 words.
    
    integer i;
    
    initial begin
        for (i = 0; i < 4200; i = i + 1) begin
        memory[i] = 0;
        end
        (* mark_debug = "true" *)$readmemh("data_memory.mem", memory);
    end
    
    assign ReadData = (MemRead == 1) ? memory[Address[14:2]] :
                      32'd0; 

    always @(posedge Clk) begin
        if (MemWrite == 2'b01) begin
            memory[Address[14:2]] = WriteData;
        end
        else if (MemWrite == 2'b10) begin
            if (Address[1] == 1'b0) begin
                memory[Address[14:2]][15:0] = WriteData[15:0];
            end
            else begin
                memory[Address[14:2]][31:16] = WriteData[15:0];
            end 
        end
        else if (MemWrite == 2'b11) begin
            if (Address[1:0] == 2'b00) begin
                memory[Address[14:2]][7:0] = WriteData[7:0];
            end
            else if (Address[1:0] == 2'b01) begin
                memory[Address[14:2]][15:8] = WriteData[7:0];
            end
            else if (Address[1:0] == 2'b10) begin
                memory[Address[14:2]][23:16] = WriteData[7:0];
            end
            else begin
                memory[Address[14:2]][31:24] = WriteData[7:0];
            end
   
        end
    end

endmodule
