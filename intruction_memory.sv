module InstructionMemory (
    input wire clk,
    input wire [31:0] addr,
    output reg [31:0] instruction
);

// Define memory depth and width
parameter MEM_DEPTH = 1024; // You can adjust this according to your needs
parameter INSTRUCTION_WIDTH = 32; // 32-bit instructions

// Internal memory array to store instructions
reg [INSTRUCTION_WIDTH-1:0] memory [0:MEM_DEPTH-1];

// Initialize memory contents (example)
initial begin
    // Initialize memory with example instructions
    // You can replace these with your own program instructions
    memory[0] = 32'h00000000; // NOP
    memory[1] = 32'h20030001; // ADD R3, R0, R1
    memory[2] = 32'h22030001; // SUB R3, R0, R1
    // Initialize the rest of the memory with NOP instructions
    for (int i = 3; i < MEM_DEPTH; i = i + 1) begin
        memory[i] = 32'h00000000; // NOP
    end
end

// Read operation
always @(posedge clk) begin
    instruction <= memory[addr];
end

endmodule

