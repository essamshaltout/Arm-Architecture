module CortexM0_RegisterFile (
    input wire [3:0] read_register_1,  // Read register 1 address
    input wire [3:0] read_register_2,  // Read register 2 address
    input wire [3:0] write_register,   // Write register address
    input wire write_enable,            // Write enable signal
    input wire [31:0] write_data,       // Data to be written to the register
    output reg [31:0] read_data_1,      // Data read from register 1
    output reg [31:0] read_data_2,      // Data read from register 2
    output reg [31:0] R0,               // General-purpose register R0
    output reg [31:0] R1,               // General-purpose register R1
    output reg [31:0] R2,               // General-purpose register R2
    output reg [31:0] R3,               // General-purpose register R3
    output reg [31:0] R4,               // General-purpose register R4
    output reg [31:0] R5,               // General-purpose register R5
    output reg [31:0] R6,               // General-purpose register R6
    output reg [31:0] R7,               // General-purpose register R7
    output reg [31:0] R8,               // General-purpose register R8
    output reg [31:0] R9,               // General-purpose register R9
    output reg [31:0] R10,              // General-purpose register R10
    output reg [31:0] R11,              // General-purpose register R11
    output reg [31:0] R12,              // General-purpose register R12
    output reg [31:0] SP,               // Stack Pointer register
    output reg [31:0] PC                // Program Counter register
);

// Define the register file
reg [31:0] registers [0:15]; // 16 registers, each 32 bits wide

// Read operation
always @* begin
    read_data_1 = registers[read_register_1];
    read_data_2 = registers[read_register_2];
end

// Write operation
always @* begin
    if (write_enable)
        registers[write_register] <= write_data;
end

// Assign specific registers for Cortex-M0 architecture
assign R0 = registers[0];
assign R1 = registers[1];
assign R2 = registers[2];
assign R3 = registers[3];
assign R4 = registers[4];
assign R5 = registers[5];
assign R6 = registers[6];
assign R7 = registers[7];
assign R8 = registers[8];
assign R9 = registers[9];
assign R10 = registers[10];
assign R11 = registers[11];
assign R12 = registers[12];
assign SP = registers[13];
assign PC = registers[14];

endmodule
