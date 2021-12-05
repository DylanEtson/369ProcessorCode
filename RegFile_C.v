`timescale 1ns / 1ps

// FINISHED!

module RegFile_C(Clk, 
                 cRegWrite1, cRegWrite2,
                 ReadReg1, ReadReg2,
                 WriteReg1, WriteReg2,
                 WriteData1, WriteData2,
                 
                 oReadData1, oReadData2,
                 oV0, oV1);

    input Clk, cRegWrite1, cRegWrite2;
    input [4:0] ReadReg1, ReadReg2;
    input [4:0] WriteReg1, WriteReg2;
    input [31:0] WriteData1, WriteData2;
    
    output [31:0] oReadData1, oReadData2;
    output [31:0] oV0, oV1;

    (* mark_debug = "true" *) reg [31:0] memory [0:31]; //Local memory. 32 Registers, 32 bits wide each.
    
    integer i;
    
    initial begin                               
        for (i = 0; i <= 31; i = i + 1) begin
            memory[i] = 0;
        end
        memory[29] = 32'd16800;
        
    end
    
    always @(negedge Clk) begin
        if (cRegWrite1 == 1) begin
            memory[WriteReg1] = WriteData1;
        end
        if (cRegWrite2 == 1) begin
            memory[WriteReg2] = WriteData2;
        end
    end
   
    assign oReadData1 = memory[ReadReg1];
    assign oReadData2 = memory[ReadReg2];
    assign oV0 = memory[5'd2];
    assign oV1 = memory[5'd3];

endmodule