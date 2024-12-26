`include "OpCodes.v"

module ID(
    input [(`INSTRUCTION_WIDTH - 1):0] instruction, 
    output [(`OPCODE_WIDTH - 1):0] opcode, 
    output [(`REG_ADDR_WIDTH - 1):0] reg_addr,
    output [(`ARG_WIDTH - 1):0] arg,
    output st_ce,
    output ld_ce,
    output cy_ce,
    output acc_ce);

    assign opcode = instruction[(`INSTRUCTION_WIDTH - 1):(`INSTRUCTION_WIDTH - `OPCODE_WIDTH)];
    assign reg_addr = instruction[(`INSTRUCTION_WIDTH - `OPCODE_WIDTH - 1):(`INSTRUCTION_WIDTH - `OPCODE_WIDTH - `REG_ADDR_WIDTH)];
    assign arg = instruction[(`ARG_WIDTH - 1):0];
    assign st_ce = (opcode == `ST);
    assign ld_ce = (opcode == `LD);
    assign cy_ce = (opcode == `ADD);
    assign acc_ce = (opcode == `ADD) || (opcode == `SUB) || (opcode == `LD) || (opcode == `AND) || (opcode == `OR) || (opcode == `XOR) || (opcode == `NOT) || (opcode == `JMP) || (opcode == `JZ);

endmodule