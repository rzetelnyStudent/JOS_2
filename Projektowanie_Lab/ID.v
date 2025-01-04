`include "OpCodes.v"

// Instruction Decoder module
module ID(
    input [(`INSTRUCTION_WIDTH - 1):0] instruction,     // Instruction word read from memory
    output [(`OPCODE_WIDTH - 1):0] opcode,              // Opcode decoded from instruction
    output [(`REG_ADDR_WIDTH - 1):0] reg_addr,          // Register address decoded from instruction
    output [(`ARG_WIDTH - 1):0] arg,                    // Argument decoded from instruction
    output st_ce,                                       // Store enable signal
    output ld_ce,                                       // Load enable signal
    output cy_ce,                                       // Carry - out enable signal
    output acc_ce);                                     // Accumulator write enable signal

    assign opcode = instruction[(`INSTRUCTION_WIDTH - 1):(`INSTRUCTION_WIDTH - `OPCODE_WIDTH)];
    assign reg_addr = instruction[(`INSTRUCTION_WIDTH - `OPCODE_WIDTH - 1):(`INSTRUCTION_WIDTH - `OPCODE_WIDTH - `REG_ADDR_WIDTH)];
    assign arg = instruction[(`ARG_WIDTH - 1):0];
    assign st_ce = (opcode == `ST);
    assign ld_ce = (opcode == `LD);
    assign cy_ce = (opcode == `ADD);
    assign acc_ce = (opcode == `ADD) || (opcode == `SUB) || (opcode == `LD) || (opcode == `AND) || (opcode == `OR) || (opcode == `XOR) || (opcode == `NOT) || (opcode == `JMP) || (opcode == `JZ);

endmodule