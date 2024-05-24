module InstructionDecoder (
    input wire [31:0] instruction,
    output reg alu_src,
    output reg [1:0] alu_op,
    output reg [3:0] reg1,  // Read register 1 address
    output reg [3:0] reg2,  // Read register 2 address
    output reg [3:0] reg_dest
);


// Define instruction opcodes
parameter NOP_OP = 4'h0;
parameter ADD_OP = 4'h2;
parameter SUB_OP = 4'h4;

// Decode instruction
always @* begin
reg1 = instruction[27:24];
reg2 = instruction[23:20];
reg_dest = instruction[19:16];
  
    case (instruction[31:28])
        NOP_OP: begin
            alu_src = 0;
            alu_op = 2'b00; // No operation
		
        end
        ADD_OP: begin
            alu_src = 1;
            alu_op = 2'b00; // ADD operation

        end
        SUB_OP: begin
            alu_src = 1;
            alu_op = 2'b01; // SUB operation

        end
        default: begin
            // Handle unsupported instructions
            alu_src = 0;
            alu_op = 2'b00; // No operation

        end
    endcase
end

endmodule

