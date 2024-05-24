`timescale 1ns / 1ps

module InstructionDecoder_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg [31:0] instruction;
    wire alu_src;
    wire [1:0] alu_op;
  wire[3:0] reg1;
  wire[3:0] reg2;
  wire[3:0] reg_dest;

    // Instantiate the InstructionDecoder module
    InstructionDecoder dut (
        .instruction(instruction),
        .alu_src(alu_src),
      .alu_op(alu_op),
      .reg1(reg1),
      .reg2(reg2),
      .reg_dest(reg_dest)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test case
    initial begin
        clk = 0;
        // NOP instruction
        instruction = 32'h00000000;
        #10; // Wait for a few clock cycles
        $display("Time: %0t, Instruction: NOP, ALU Source: %b, ALU Operation: %b, R1: %b , R2: %b, R3: %b", $time, alu_src, alu_op, reg1, reg2, reg_dest);

        // ADD instruction
        instruction = 32'h21350001; // ADD R3, R0, R1
        #10; // Wait for a few clock cycles
        $display("Time: %0t, Instruction: ADD, ALU Source: %b, ALU Operation: %b, R1: %b , R2: %b, R3: %b", $time, alu_src, alu_op, reg1, reg2, reg_dest);

        // SUB instruction
        instruction = 32'h47410001; // SUB R3, R0, R1
        #10; // Wait for a few clock cycles
        $display("Time: %0t, Instruction: SUB, ALU Source: %b, ALU Operation: %b, R1: %b , R2: %b, R3: %b", $time, alu_src, alu_op, reg1, reg2, reg_dest);

        // Add more test cases as needed

        $stop; // Stop simulation
    end

endmodule

