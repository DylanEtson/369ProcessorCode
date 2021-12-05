`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2021 05:23:00 PM
// Design Name: 
// Module Name: BranchDecoder_C
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


module BranchDecoder_C(Clk, Instruction, Bit16, ReadReg1, ReadReg2, Cache,
                       PCSrc, RegWrite2BC);

input Clk;
input Bit16;
input [31:0] Instruction;
input [31:0] ReadReg1, ReadReg2;
input Cache;

output RegWrite2BC;
output reg [2:0] PCSrc;

initial begin
    PCSrc = 3'd0;
end

always @(posedge Clk or Instruction or ReadReg1 or ReadReg2) begin
   
    
    /// BGEZ / BLTZ
    if (Instruction[31:26] == 6'b000001) begin
    
        // BGEZ
        if (Bit16 == 1'd1) begin
            // Condition satisfied & branch target is loaded, then business as usual
            if (({~(ReadReg1[31]), ReadReg1} >= {1'd1, 32'd0}) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if (({~(ReadReg1[31]), ReadReg1} >= {1'd1, 32'd0}) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
        end
        // BLTZ
        else begin
            // Condition satisfied & branch target is loaded, then business as usual
            if (({~(ReadReg1[31]), ReadReg1} < {1'd1, 32'd0}) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if (({~(ReadReg1[31]), ReadReg1} < {1'd1, 32'd0}) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
        end
    end
    /// BEQ
    else if (Instruction[31:26] == 6'b000100) begin
        // Condition satisfied & branch target is loaded, then business as usual
            if ((ReadReg1 == ReadReg2) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if ((ReadReg1 == ReadReg2) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
    end
    
    /// BNE
    else if (Instruction[31:26] == 6'b000101) begin
        // Condition satisfied & branch target is loaded, then business as usual
            if ((ReadReg1 != ReadReg2) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if ((ReadReg1 != ReadReg2) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
    end
    
    /// BGTZ
    else if (Instruction[31:26] == 6'b000111) begin
        // Condition satisfied & branch target is loaded, then business as usual
            if (({~(ReadReg1[31]), ReadReg1} > {1'd1, 32'd0}) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if (({~(ReadReg1[31]), ReadReg1} > {1'd1, 32'd0}) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
    end
    
    /// BLEZ
    else if (Instruction[31:26] == 6'b000110) begin
        // Condition satisfied & branch target is loaded, then business as usual
            if (({~(ReadReg1[31]), ReadReg1} <= {1'd1, 32'd0}) && Cache == 1) begin
                PCSrc = 3'd0;
            end
            // Condition satisfied but branch is NOT loaded, then branch
            else if (({~(ReadReg1[31]), ReadReg1} <= {1'd1, 32'd0}) && Cache == 0) begin
                PCSrc = 3'd1;
            end
            // Condition not satisfied, then return to next instruction
            else begin
                PCSrc = 3'd4;
            end
    end
    
    /// J
    else if (Instruction[31:26] == 6'b000010) begin
        if (Cache == 1) begin
            PCSrc = 3'd0;
        end
        else begin
            PCSrc = 3'd2;
        end
    end
    
    /// JR
    else if (Instruction[31:26] == 6'b000000 && Instruction[5:0] == 6'b001000) begin
        PCSrc = 3'd3;
    end
    
    /// JAL
    else if (Instruction[31:26] == 6'b000011) begin
        if (Cache == 1) begin
            PCSrc = 3'd0;
        end
        else begin
            PCSrc = 3'd2;
        end
    end
    
    else begin
        PCSrc = 3'd0;
    end
    
end

// JAL RegWrite2

assign RegWrite2BC = (Instruction[31:26] == 6'b000011) ? 1'd1 :
                     1'd0;

endmodule
