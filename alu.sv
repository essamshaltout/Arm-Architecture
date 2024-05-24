module CortexM0_ALU (
    input wire [31:0] operand1,    // Operand 1
    input wire [31:0] operand2,    // Operand 2
    input wire [1:0] alu_control,  // ALU control (00: ADD, 01: SUB)
    output reg [31:0] result       // ALU result
);

// Perform arithmetic operation based on alu_control
always @* begin
    case (alu_control)
        2'b00: result = operand1 + operand2; // ADD operation
        2'b01: result = operand1 - operand2; // SUB operation
        default: result = 32'h00000000;      // Default: No operation
    endcase
end

endmodule
