`timescale 1ns / 1ps

module InstructionMemory_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    parameter MEM_DEPTH = 1024; // Memory depth
    parameter INSTRUCTION_WIDTH = 32; // Instruction width

    // Signals
    reg clk;
    reg [31:0] addr;
    wire [31:0] instruction;

    // Instantiate the InstructionMemory module
    InstructionMemory dut (
        .clk(clk),
        .addr(addr),
        .instruction(instruction)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test case
    initial begin
        clk = 0;
        addr = 0;
        #10; // Wait for a few clock cycles
        // Read instructions from memory and display them
        $display("Reading instructions from memory:");
        for (int i = 0; i < MEM_DEPTH; i = i + 1) begin
            addr = i;
            #10; // Wait for a few clock cycles
            $display("Instruction[%d]: %h", i, instruction);
        end
        // Stop simulation
    end

endmodule

