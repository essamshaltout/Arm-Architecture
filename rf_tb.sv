
`timescale 1ns / 1ps

module CortexM0_RegisterFile_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg [3:0] read_register_1, read_register_2, write_register;
    reg write_enable;
    reg [31:0] write_data;
    wire [31:0] read_data_1, read_data_2;
    wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, SP, PC;

    // Instantiate the CortexM0_RegisterFile module
    CortexM0_RegisterFile dut (
        .read_register_1(read_register_1),
        .read_register_2(read_register_2),
        .write_register(write_register),
        .write_enable(write_enable),
        .write_data(write_data),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .R0(R0),
        .R1(R1),
        .R2(R2),
        .R3(R3),
        .R4(R4),
        .R5(R5),
        .R6(R6),
        .R7(R7),
        .R8(R8),
        .R9(R9),
        .R10(R10),
        .R11(R11),
        .R12(R12),
        .SP(SP),
        .PC(PC)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Test case
    initial begin
        clk = 0;

        // Write data to R3 register
        write_register = 3;
        write_enable = 1;
        write_data = 32'hABCDEF01;
        #10; // Wait for a few clock cycles

        // Read data from registers R1 and R2
        read_register_1 = 1;
        read_register_2 = 2;
        #10; // Wait for a few clock cycles

        // Display register values
        $display("R1: %h, R2: %h, R3: %h", R1, R2, R3);

        $stop; // Stop simulation
    end

endmodule
