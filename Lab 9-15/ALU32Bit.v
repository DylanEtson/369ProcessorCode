`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// BertButEt Modified
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 64-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [4:0] ALUControl; // 5 bit ALU control signal
                                
	input [31:0] A, B;	    // inputs

	output [63:0] ALUResult;	// answer
	output Zero;	    // Zero=1 if ALUResult == 0

    reg [63:0] sra, srav = 64'b0;
    reg [4:0] shamt = 5'b0;
    
    always @(A or B or ALUControl) begin
        shamt = B[10:6];
    
        case(shamt)
            5'd0 : sra = A;
            5'd1 : sra = {A[31], A[31:1]};
            5'd2 : sra = {{2{A[31]}}, A[31:2]};
            5'd3 : sra = {{3{A[31]}}, A[31:3]};
            5'd4 : sra = {{4{A[31]}}, A[31:4]};
            5'd5 : sra = {{5{A[31]}}, A[31:5]};
            5'd6 : sra = {{6{A[31]}}, A[31:6]};
            5'd7 : sra = {{7{A[31]}}, A[31:7]};
            5'd8 : sra = {{8{A[31]}}, A[31:8]};
            5'd9 : sra = {{9{A[31]}}, A[31:9]};
            5'd10 : sra = {{10{A[31]}}, A[31:10]};
            5'd11 : sra = {{11{A[31]}}, A[31:11]};
            5'd12 : sra = {{12{A[31]}}, A[31:12]};
            5'd13 : sra = {{13{A[31]}}, A[31:13]};
            5'd14 : sra = {{14{A[31]}}, A[31:14]};
            5'd15 : sra = {{15{A[31]}}, A[31:15]};
            5'd16 : sra = {{16{A[31]}}, A[31:16]};
            5'd17 : sra = {{17{A[31]}}, A[31:17]};
            5'd18 : sra = {{18{A[31]}}, A[31:18]};
            5'd19 : sra = {{19{A[31]}}, A[31:19]};
            5'd20 : sra = {{20{A[31]}}, A[31:20]};
            5'd21 : sra = {{21{A[31]}}, A[31:21]};
            5'd22 : sra = {{22{A[31]}}, A[31:22]};
            5'd23 : sra = {{23{A[31]}}, A[31:23]};
            5'd24 : sra = {{24{A[31]}}, A[31:24]};
            5'd25 : sra = {{25{A[31]}}, A[31:25]};
            5'd26 : sra = {{26{A[31]}}, A[31:26]};
            5'd27 : sra = {{27{A[31]}}, A[31:27]};
            5'd28 : sra = {{28{A[31]}}, A[31:28]};
            5'd29 : sra = {{29{A[31]}}, A[31:29]};
            5'd30 : sra = {{30{A[31]}}, A[31:30]};
            5'd31 : sra = {{31{A[31]}}, A[31:31]};
            default : sra = {32{A[31]}};
        endcase
        
        case(A)
            5'd0 : srav = B;
            5'd1 : srav = {B[31], B[31:1]};
            5'd2 : srav = {{2{B[31]}}, B[31:2]};
            5'd3 : srav = {{3{B[31]}}, B[31:3]};
            5'd4 : srav = {{4{B[31]}}, B[31:4]};
            5'd5 : srav = {{5{B[31]}}, B[31:5]};
            5'd6 : srav = {{6{B[31]}}, B[31:6]};
            5'd7 : srav = {{7{B[31]}}, B[31:7]};
            5'd8 : srav = {{8{B[31]}}, B[31:8]};
            5'd9 : srav = {{9{B[31]}}, B[31:9]};
            5'd10 : srav = {{10{B[31]}}, B[31:10]};
            5'd11 : srav = {{11{B[31]}}, B[31:11]};
            5'd12 : srav = {{12{B[31]}}, B[31:12]};
            5'd13 : srav = {{13{B[31]}}, B[31:13]};
            5'd14 : srav = {{14{B[31]}}, B[31:14]};
            5'd15 : srav = {{15{B[31]}}, B[31:15]};
            5'd16 : srav = {{16{B[31]}}, B[31:16]};
            5'd17 : srav = {{17{B[31]}}, B[31:17]};
            5'd18 : srav = {{18{B[31]}}, B[31:18]};
            5'd19 : srav = {{19{B[31]}}, B[31:19]};
            5'd20 : srav = {{20{B[31]}}, B[31:20]};
            5'd21 : srav = {{21{B[31]}}, B[31:21]};
            5'd22 : srav = {{22{B[31]}}, B[31:22]};
            5'd23 : srav = {{23{B[31]}}, B[31:23]};
            5'd24 : srav = {{24{B[31]}}, B[31:24]};
            5'd25 : srav = {{25{B[31]}}, B[31:25]};
            5'd26 : srav = {{26{B[31]}}, B[31:26]};
            5'd27 : srav = {{27{B[31]}}, B[31:27]};
            5'd28 : srav = {{28{B[31]}}, B[31:28]};
            5'd29 : srav = {{29{B[31]}}, B[31:29]};
            5'd30 : srav = {{30{B[31]}}, B[31:30]};
            5'd31 : srav = {{31{B[31]}}, B[31:31]};
            default : srav = {32{B[31]}};
        endcase
        
        
        
        
        
        
    end



    /* Please fill in the implementation here... */
    
    // Zero
    assign ALUResult = (ALUControl == 5'd0) ?  64'b0 :
    // Signed A
                       (ALUControl == 5'd1) ?  { {32{A[31]}}, A} :
    // Unsigned 
                       (ALUControl == 5'd2) ?  { {32'b0}, A} :
    // Signed B 
                       (ALUControl == 5'd3) ?  { {32{B[31]}}, B} :
    // Unsigned B
                       (ALUControl == 5'd4) ?  { {32'b0}, B} :                   
    // AND
                       (ALUControl == 5'd5) ?  {{32{A[31]}}, A} & {{32{B[31]}}, B} : 
    // OR
                       (ALUControl == 5'd6) ?  { {32{A[31]}}, A} | { {32{B[31]}}, B} : 
    // XOR 
                       (ALUControl == 5'd7) ?  { {32{A[31]}}, A} ^ { {32{B[31]}}, B} : 
    // NOR 
                       (ALUControl == 5'd8) ?  {~{ {32{A[31]}}, A} & ~{ {32{B[31]}}, B}} : 
    // Addition 
                       (ALUControl == 5'd9) ?  { {32{A[31]}}, A} + { {32{B[31]}}, B} : 
    // Subtraction 
                       (ALUControl == 5'd10) ?  { {32{A[31]}}, A} - { {32{B[31]}}, B} :
    // Subtraction Reverse
                       (ALUControl == 5'd11) ?  { {32{B[31]}}, B} - { {32{A[31]}}, A} :
    // Signed Multiplication
                       (ALUControl == 5'd12) ?  { {32{A[31]}}, A} * { {32{B[31]}}, B} :
    // Unsigned Multiplication 
                       (ALUControl == 5'd13) ? {32'b0, A} * {32'b0, B} :
    // Division 
                       (ALUControl == 5'd14) ?  { {32{A[31]}}, A} / { {32{B[31]}}, B} :
    // SLL
                       (ALUControl == 5'd15) ?  A << B[10:6] :
    // SRL
                       (ALUControl == 5'd16) ?  A >> B[10:6] : 
    // SLLV 
                       (ALUControl == 5'd17) ?  B << A :
    // SRLV 
                       (ALUControl == 5'd18) ?  B >> A : 
    // SRA
                       (ALUControl == 5'd19) ?  sra :   
    // SRAV 
                       (ALUControl == 5'd20) ?  srav :
    // ROTR 
                       (ALUControl == 5'd21) ?  { {A >> B[10:6]} | {A << {32'd32 - B[10:6]}} } : 
    // ROTRV 
                       (ALUControl == 5'd22) ?  { {B >> A} | {B << {32'd32 - A}} } :
    // SEQ 
                       (ALUControl == 5'd23) ?  (A == B) :
    // SNE 
                       (ALUControl == 5'd24) ?  (A != B) : 
    // SLT
                       (ALUControl == 5'd25) ?  ({{1{~A[31]}}, A} < {{1{~B[31]}}, B}) :                   
    // SLTE 
                       (ALUControl == 5'd26) ?  (A <= B) :
    // SGT 
                       (ALUControl == 5'd27) ?  (A > B) : 
    // SGTE
                       (ALUControl == 5'd28) ?  (A >= B) :                
    // SLTU 
                       (ALUControl == 5'd29) ?  ({1'b0, A} < {1'b0, B}) :
    // Else
                       64'b0 ;
                       
    assign Zero = (ALUResult == 32'b0);
                       
    
    

endmodule

