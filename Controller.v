`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: BERTBUTET
// 
// Create Date: 10/12/2021 09:44:03 AM
// Design Name: 
// Module Name: Controller
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


module Controller(Instruction,
                  PCMux, Branch, RegWriteCtrl, Move, RegDst, RegAddress, MemRead, Jump,
                  SEMux, ALUSrcA, ALUSrcB, MemWrite,
                  MemToReg, HiLoOp,
                  ALUCtrl);


input [31:0] Instruction;

reg [26:0] Signals;

output reg PCMux, Branch, RegWriteCtrl, Move, RegDst, RegAddress, MemRead, Jump;
output reg [1:0] SEMux, ALUSrcA, ALUSrcB, MemWrite;
output reg [2:0] MemToReg, HiLoOp;
output reg [4:0] ALUCtrl;



always @(Instruction) begin

    ///// SPECIAL1

    if (Instruction[31:26] == 6'b000000) begin
    
        // ADD
        if (Instruction[5:0] == 6'b100000) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd9};
        end
        
        // ADDU
        else if (Instruction[5:0] == 6'b100001) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd9};
        end
        
        // SUB
        else if (Instruction[5:0] == 6'b100010) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd10};
        end
        
        // MULT
        else if (Instruction[5:0] == 6'b011000) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd1, 5'd12};
        end
        
        // MULTU
        else if (Instruction[5:0] == 6'b011001) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd1, 5'd13};
        end
        
        // JR
        else if (Instruction[5:0] == 6'b001000) begin
            Signals = {8'b11000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd0, 5'd0};
        end
        
        // AND
        else if (Instruction[5:0] == 6'b100100) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd5};
        end
        
        // OR
        else if (Instruction[5:0] == 6'b100101) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd6};
        end
        
        // NOR
        else if (Instruction[5:0] == 6'b100111) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd8};
        end
        
        // XOR
        else if (Instruction[5:0] == 6'b100110) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd7};
        end
        
        // SLL
        else if (Instruction[5:0] == 6'b000000) begin
            Signals = {8'b00101000, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd15};
        end
        
        /// SRL / ROTR
        else if (Instruction[5:0] == 6'b000010) begin
            
            //SRL
            if (Instruction[21] == 0) begin
                Signals = {8'b00101000, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd16};
            end
            
            //ROTR
            else if (Instruction[21] == 1) begin
                Signals = {8'b00101000, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd21};
            end
        end
        
        // SLLV
        else if (Instruction[5:0] == 6'b000100) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd17};
        end
        
        /// SRLV / ROTRV
        else if (Instruction[5:0] == 6'b000110) begin
            
            //SRLV
            if (Instruction[6] == 0) begin
                Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd18};
            end
            
            //ROTRV
            else if (Instruction[6] == 1) begin
                Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd22};
            end
        end
        
        // SLT
        else if (Instruction[5:0] == 6'b101010) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd25};
        end
        
        // MOVN
        else if (Instruction[5:0] == 6'b001011) begin
            Signals = {8'b00011000, 2'd0, 2'd2, 2'd0, 2'd0, 3'd3, 3'd0, 5'd23};
        end
        
        // MOVZ
        else if (Instruction[5:0] == 6'b001010) begin
            Signals = {8'b00011000, 2'd0, 2'd2, 2'd0, 2'd0, 3'd3, 3'd0, 5'd24};
        end
        
        // SRA
        else if (Instruction[5:0] == 6'b000011) begin
            Signals = {8'b00101000, 2'd0, 2'd1, 2'd1, 2'd0, 3'd1, 3'd0, 5'd19};
        end
        
        // SRAV
        else if (Instruction[5:0] == 6'b000111) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd20};
        end
        
        // SLTU
        else if (Instruction[5:0] == 6'b101011) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd29};
        end
        
        // MTHI
        else if (Instruction[5:0] == 6'b010001) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd4, 5'd1};
        end
        
        // MTLO
        else if (Instruction[5:0] == 6'b010011) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd5, 5'd1};
        end
        
        // MFHI
        else if (Instruction[5:0] == 6'b010000) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd4, 3'd0, 5'd0};
        end
        
        // MFLO
        else if (Instruction[5:0] == 6'b010010) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd5, 3'd0, 5'd0};
        end
        
    end
    
    ///// SPECIAL2
    
    else if (Instruction[31:26] == 6'b011100) begin
        
        // MUL
        if (Instruction[5:0] == 6'b000010) begin
            Signals = {8'b00101000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd12};
        end
        
        // MADD
        else if (Instruction[5:0] == 6'b000000) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd2, 5'd12};
        end
        
        //MSUB 
        else if (Instruction[5:0] == 6'b000100) begin
            Signals = {8'b00000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd1, 3'd3, 5'd12};
        end
    end
    
    ///// SPECIAL3
    
    else if (Instruction[31:26] == 6'b011111) begin
    
        /// SEB / SEH
        if (Instruction[5:0] == 6'b100000) begin
        
            // SEB
            if (Instruction[10:6] == 5'b10000) begin
                Signals = {8'b00101000, 2'd2, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd3};
            end
            
            // SEH
            else if (Instruction[10:6] == 5'b11000) begin
                Signals = {8'b00101000, 2'd1, 2'd0, 2'd0, 2'd0, 3'd1, 3'd0, 5'd3};
            end
        end
        
    end
    
    ///// IMMEDIATES
    
    // ADDIU
    else if (Instruction[31:26] == 6'b001001) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd9};
    end
    
    // ADDI
    else if (Instruction[31:26] == 6'b001000) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd9};
    end
    
    // LW
    else if (Instruction[31:26] == 6'b100011) begin
        Signals = {8'b00100010, 2'd0, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // SW
    else if (Instruction[31:26] == 6'b101011) begin
        Signals = {8'b00000000, 2'd0, 2'd0, 2'd1, 2'd1, 3'd0, 3'd0, 5'd9};
    end
    
    // SB
    else if (Instruction[31:26] == 6'b101000) begin
        Signals = {8'b00000000, 2'd0, 2'd0, 2'd1, 2'd3, 3'd0, 3'd0, 5'd9};
    end
    
    // LH
    else if (Instruction[31:26] == 6'b100001) begin
        Signals = {8'b00100010, 2'd1, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // LB
    else if (Instruction[31:26] == 6'b100000) begin
        Signals = {8'b00100010, 2'd2, 2'd0, 2'd1, 2'd0, 3'd0, 3'd0, 5'd9};
    end
    
    // SH
    else if (Instruction[31:26] == 6'b101001) begin
        Signals = {8'b00000000, 2'd0, 2'd0, 2'd1, 2'd2, 3'd0, 3'd0, 5'd9};
    end
    
    // LUI
    else if (Instruction[31:26] == 6'b001111) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd2, 2'd0, 3'd1, 3'd0, 5'd3};
    end
    
    /// BGEZ / BLTZ
    else if (Instruction[31:26] == 6'b000001) begin
    
        //BGEZ
        if (Instruction[20:16] == 5'b00001) begin
            Signals = {8'b01000000, 2'd0, 2'd0, 2'd3, 2'd0, 3'd0, 3'd0, 5'd25};
        end
        
        //BLTZ
        else if (Instruction[20:16] == 5'b00000) begin
            Signals = {8'b01000000, 2'd0, 2'd0, 2'd3, 2'd0, 3'd0, 3'd0, 5'd28};
        end
    end
    
    // BEQ
    else if (Instruction[31:26] == 6'b000100) begin
        Signals = {8'b01000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd0, 5'd24};
    end
    
    // BNE
    else if (Instruction[31:26] == 6'b000101) begin
        Signals = {8'b01000000, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd0, 5'd23};
    end
    
    // BGTZ
    else if (Instruction[31:26] == 6'b000111) begin
        Signals = {8'b01000000, 2'd0, 2'd0, 2'd3, 2'd0, 3'd0, 3'd0, 5'd26};
    end
    
    // BLEZ
    else if (Instruction[31:26] == 6'b000110) begin
        Signals = {8'b01000000, 2'd0, 2'd0, 2'd3, 2'd0, 3'd0, 3'd0, 5'd27};
    end
    
    // J
    else if (Instruction[31:26] == 6'b000010) begin
        Signals = {8'b01000001, 2'd0, 2'd0, 2'd0, 2'd0, 3'd0, 3'd0, 5'd0};
    end
    
    // JAL
    else if (Instruction[31:26] == 6'b000011) begin
        Signals = {8'b01100101, 2'd0, 2'd0, 2'd0, 2'd0, 3'd2, 3'd0, 5'd0};
    end
    
    // ANDI
    else if (Instruction[31:26] == 6'b001100) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd5};
    end
    
    // ORI
    else if (Instruction[31:26] == 6'b001101) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd6};
    end
    
    // XORI
    else if (Instruction[31:26] == 6'b001110) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd7};
    end
    
    // SLTI
    else if (Instruction[31:26] == 6'b001010) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd25};
    end 
    
    // SLTIU
    else if (Instruction[31:26] == 6'b001011) begin
        Signals = {8'b00100000, 2'd0, 2'd0, 2'd1, 2'd0, 3'd1, 3'd0, 5'd29};
    end
    
    ///// OTHERWISE
     
    else begin
        Signals = 27'b0;
    end

    //Assign control values
        PCMux = Signals[26];
	    Branch = Signals[25];
        RegWriteCtrl = Signals[24];
        Move = Signals[23];
        RegDst = Signals[22];
        RegAddress = Signals[21];
        MemRead = Signals[20];
        Jump = Signals[19];
        SEMux = Signals[18:17];
        ALUSrcA = Signals[16:15];
        ALUSrcB = Signals[14:13];
        MemWrite = Signals[12:11];
        MemToReg = Signals[10:8];
        HiLoOp = Signals[7:5];
        ALUCtrl = Signals[4:0];
end


endmodule
