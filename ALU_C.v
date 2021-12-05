`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 02:34:24 PM
// Design Name: 
// Module Name: ALU_C
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


module ALU_C(A, B, 
             ALUControl,
             ALUResult, Zero);

	input [4:0] ALUControl; // 5 bit ALU control signal
                                
	input [31:0] A, B;	    // inputs

	output reg [63:0] ALUResult;	// answer
	output Zero;	    // Zero=1 if ALUResult == 0

    always @(A or B or ALUControl) begin
        if (ALUControl == 5'd0) begin
            ALUResult = 64'b0;
        end
        else if (ALUControl == 5'd1) begin
            ALUResult = { {32{A[31]}}, A};
        end
        else if (ALUControl == 5'd2) begin
            ALUResult = { {32'b0}, A};
        end
        else if (ALUControl == 5'd3) begin
            ALUResult = { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd4) begin
            ALUResult = { {32'b0}, B};
        end
        else if (ALUControl == 5'd5) begin
            ALUResult = {{32{A[31]}}, A} & {{32{B[31]}}, B};
        end
        else if (ALUControl == 5'd6) begin
            ALUResult = { {32{A[31]}}, A} | { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd7) begin
            ALUResult = { {32{A[31]}}, A} ^ { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd8) begin
            ALUResult = {~{ {32{A[31]}}, A} & ~{ {32{B[31]}}, B}};
        end
        else if (ALUControl == 5'd9) begin
            ALUResult = { {32{A[31]}}, A} + { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd10) begin
            ALUResult = { {32{A[31]}}, A} - { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd11) begin
            ALUResult = { {32{B[31]}}, B} - { {32{A[31]}}, A};
        end
        else if (ALUControl == 5'd12) begin
            ALUResult = { {32{A[31]}}, A} * { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd13) begin
            ALUResult = {32'b0, A} * {32'b0, B};
        end
        else if (ALUControl == 5'd14) begin
            ALUResult = { {32{A[31]}}, A} / { {32{B[31]}}, B};
        end
        else if (ALUControl == 5'd15) begin
            ALUResult = A << B[10:6];
        end
        else if (ALUControl == 5'd16) begin
            ALUResult = A >> B[10:6];
        end
        else if (ALUControl == 5'd17) begin
            ALUResult = B << A;
        end
        else if (ALUControl == 5'd18) begin
            ALUResult = B >> A;
        end
        else if (ALUControl == 5'd19) begin
            if (A[31] == 0) begin
                ALUResult = A >> B[10:6];
            end
            else begin
                ALUResult = ~((~A) >> B[10:6]);
            end
        end
        else if (ALUControl == 5'd20) begin
            if (B[31] == 0) begin
                ALUResult = B >> A;
            end
            else begin
                ALUResult = ~((~B) >> A);
            end 
        end
        else if (ALUControl == 5'd21) begin
            ALUResult = { {A >> B[10:6]} | {A << {32'd32 - B[10:6]}} };
        end
        else if (ALUControl == 5'd22) begin
            ALUResult = { {B >> A} | {B << {32'd32 - A}} };
        end
        else if (ALUControl == 5'd23) begin
            ALUResult = (A == B);
        end
        else if (ALUControl == 5'd24) begin
            ALUResult = (A != B);
        end
        else if (ALUControl == 5'd25) begin
            ALUResult = ({{1{~A[31]}}, A} < {{1{~B[31]}}, B});
        end
        else if (ALUControl == 5'd26) begin
            ALUResult = ({{1{~A[31]}}, A} <= {{1{~B[31]}}, B});
        end
        else if (ALUControl == 5'd27) begin
            ALUResult = ({{1{~A[31]}}, A} > {{1{~B[31]}}, B});
        end
        else if (ALUControl == 5'd28) begin
            ALUResult = ({{1{~A[31]}}, A} >= {{1{~B[31]}}, B});
        end
        else if (ALUControl == 5'd29) begin
            ALUResult = ({1'b0, A} < {1'b0, B});
        end
        else begin
            ALUResult = 64'd0;
        end    
    end

    assign Zero = (ALUResult == 64'b0);

endmodule
