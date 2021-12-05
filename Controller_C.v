`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 09:31:00 PM
// Design Name: 
// Module Name: Controller_C
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


module Controller_C(Instruction,
                    SAD, RegWriteCtrl, Move, MemRead,
                    RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite, 
                    MemToReg, HiLoOp, 
                    ALUCtrl);

input [31:0] Instruction;
output reg SAD, RegWriteCtrl, Move, MemRead;
output reg [1:0] RegDst, SEMux, ALUSrcA, ALUSrcB, MemWrite; 
output reg [2:0] MemToReg, HiLoOp;
output reg [4:0] ALUCtrl;

reg [24:0] Signals;

always @(Instruction) begin

    ///// SPECIAL1

    if (Instruction == 32'b0) begin
        Signals = 25'b0;
    end
    else if (Instruction[31:26] == 6'b000000) begin
    
        // ADD
        if (Instruction[5:0] == 6'b100000) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd9};
        end
        
        // ADDU
        else if (Instruction[5:0] == 6'b100001) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd9};
        end
        
        // SUB
        else if (Instruction[5:0] == 6'b100010) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd10};
        end
        
        // MULT
        else if (Instruction[5:0] == 6'b011000) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd1, 5'd12};
        end
        
        // MULTU
        else if (Instruction[5:0] == 6'b011001) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd1, 5'd13};
        end
        
        // AND
        else if (Instruction[5:0] == 6'b100100) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd5};
        end
        
        // OR
        else if (Instruction[5:0] == 6'b100101) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd6};
        end
        
        // NOR
        else if (Instruction[5:0] == 6'b100111) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd8};
        end
        
        // XOR
        else if (Instruction[5:0] == 6'b100110) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd7};
        end
        
        // SLL
        else if (Instruction[5:0] == 6'b000000) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd15};
        end
        
        /// SRL / ROTR
        else if (Instruction[5:0] == 6'b000010) begin
            
            //SRL
            if (Instruction[21] == 0) begin
                Signals = {4'b0100, 2'd1, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd16};
            end
            
            //ROTR
            else if (Instruction[21] == 1) begin
                Signals = {4'b0100, 2'd1, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd21};
            end
            else begin
                Signals = 25'b0;
            end
        end
        
        // SLLV
        else if (Instruction[5:0] == 6'b000100) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd17};
        end
        
        /// SRLV / ROTRV
        else if (Instruction[5:0] == 6'b000110) begin
            
            //SRLV
            if (Instruction[6] == 0) begin
                Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd18};
            end
            
            //ROTRV
            else if (Instruction[6] == 1) begin
                Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd22};
            end
            else begin
                Signals = 25'b0;
            end
        end
        
        // SLT
        else if (Instruction[5:0] == 6'b101010) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd25};
        end
        
        // MOVN
        else if (Instruction[5:0] == 6'b001011) begin
            Signals = {4'b0010, 2'd1, 2'd0, 2'd2, 2'd0, 2'd0, 3'd3, 3'd0, 5'd23};
        end
        
        // MOVZ
        else if (Instruction[5:0] == 6'b001010) begin
            Signals = {4'b0010, 2'd1, 2'd0, 2'd2, 2'd0, 2'd0, 3'd3, 3'd0, 5'd24};
        end
        
        // SRA
        else if (Instruction[5:0] == 6'b000011) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd19};
        end
        
        // SRAV
        else if (Instruction[5:0] == 6'b000111) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd20};
        end
        
        // SLTU
        else if (Instruction[5:0] == 6'b101011) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd29};
        end
        
        // MTHI
        else if (Instruction[5:0] == 6'b010001) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd4, 5'd1};
        end
        
        // MTLO
        else if (Instruction[5:0] == 6'b010011) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd5, 5'd1};
        end
        
        // MFHI
        else if (Instruction[5:0] == 6'b010000) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd4, 3'd0, 5'd0};
        end
        
        // MFLO
        else if (Instruction[5:0] == 6'b010010) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd5, 3'd0, 5'd0};
        end
        else begin
            Signals = 25'b0;
        end
        
    end
    
    ///// SPECIAL2
    
    else if (Instruction[31:26] == 6'b011100) begin
        
        // MUL
        if (Instruction[5:0] == 6'b000010) begin
            Signals = {4'b0100, 2'd1, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd12};
        end
        
        // MADD
        else if (Instruction[5:0] == 6'b000000) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd2, 5'd12};
        end
        
        //MSUB 
        else if (Instruction[5:0] == 6'b000100) begin
            Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd3, 5'd12};
        end
        else begin
            Signals = 25'b0;
        end
    end
    
    ///// SPECIAL3
    
    else if (Instruction[31:26] == 6'b011111) begin
    
        /// SEB / SEH
        if (Instruction[5:0] == 6'b100000) begin
        
            // SEB
            if (Instruction[10:6] == 5'b10000) begin
                Signals = {4'b0100, 2'd1, 2'd2, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd3};
            end
            
            // SEH
            else if (Instruction[10:6] == 5'b11000) begin
                Signals = {4'b0100, 2'd1, 2'd1, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd3};
            end
            else begin
                Signals = 25'b0;
            end
        end
        else begin
            Signals = 25'b0;
        end
        
    end
    
    ///// IMMEDIATES
    
    // ADDIU
    else if (Instruction[31:26] == 6'b001001) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd9};
    end
    
    // ADDI
    else if (Instruction[31:26] == 6'b001000) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd9};
    end
    
    // LW
    else if (Instruction[31:26] == 6'b100011) begin
        Signals = {4'b0101, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // SW
    else if (Instruction[31:26] == 6'b101011) begin
        Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd1, 2'd1, 3'd0, 3'd0, 5'd9};
    end
    
    // SB
    else if (Instruction[31:26] == 6'b101000) begin
        Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd1, 2'd3, 3'd0, 3'd0, 5'd9};
    end
    
    // LH
    else if (Instruction[31:26] == 6'b100001) begin
        Signals = {4'b0101, 2'd0, 2'd1, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // LB
    else if (Instruction[31:26] == 6'b100000) begin
        Signals = {4'b0101, 2'd0, 2'd2, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // SH
    else if (Instruction[31:26] == 6'b101001) begin
        Signals = {4'b0000, 2'd0, 2'd0, 2'd0, 2'd1, 2'd2, 3'd0, 3'd0, 5'd9};
    end
    
    // LUI
    else if (Instruction[31:26] == 6'b001111) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd2, 2'd0, 3'd1, 3'd0, 5'd3};
    end
    
    // ANDI
    else if (Instruction[31:26] == 6'b001100) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd5};
    end
    
    // ORI
    else if (Instruction[31:26] == 6'b001101) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd6};
    end
    
    // XORI
    else if (Instruction[31:26] == 6'b001110) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd7};
    end
    
    // SLTI
    else if (Instruction[31:26] == 6'b001010) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd25};
    end 
    
    // SLTIU
    else if (Instruction[31:26] == 6'b001011) begin
        Signals = {4'b0100, 2'd0, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd29};
    end
    
    ///// SAD
    
    // SAD
    else if (Instruction[31:26] == 6'b111111) begin
        Signals = {4'b1000, 2'd2, 2'd0, 2'd0, 2'd0, 2'd0, 3'd3, 3'd0, 5'd0};
    end
    
    ///// OTHERWISE
     
    else begin
        Signals = 25'b0;
    end

    //Assign control values
        SAD = Signals[24];
        RegWriteCtrl = Signals[23];
        Move = Signals[22];
        MemRead = Signals[21];
        RegDst = Signals[20:19];
        SEMux = Signals[18:17];
        ALUSrcA = Signals[16:15];
        ALUSrcB = Signals[14:13];
        MemWrite = Signals[12:11];
        MemToReg = Signals[10:8];
        HiLoOp = Signals[7:5];
        ALUCtrl = Signals[4:0];
end

endmodule
