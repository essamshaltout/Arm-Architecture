`timescale 1ns / 1ps

module CortexM0_ALU_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg [31:0] operand1, operand2;
    reg [1:0] alu_control;
    wire [31:0] result;

    // Instantiate the CortexM0_ALU module
    CortexM0_ALU dut (
        .operand1(operand1),
        .operand2(operand2),
        .alu_control(alu_control),
        .result(result)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test case
    initial begin
        clk = 0;

        // Test addition: 10 + 20
        operand1 = 32'h0000000A; // 10
        operand2 = 32'h00000014; // 20
        alu_control = 2'b00;     // ADD
        #10; // Wait for a few clock cycles
        $display("Addition: %d + %d = %d", operand1, operand2, result);

        // Test subtraction: 20 - 10
        operand1 = 32'h00000014; // 20
        operand2 = 32'h0000000A; // 10
        alu_control = 2'b01;     // SUB
        #10; // Wait for a few clock cycles
        $display("Subtraction: %d - %d = %d", operand1, operand2, result);

        // Add more test cases as needed

        $stop; // Stop simulation
    end

endmodule

