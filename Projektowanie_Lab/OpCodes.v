`define INSTRUCTION_WIDTH 6
`define OPCODE_WIDTH 4
`define REG_ADDR_WIDTH (`INSTRUCTION_WIDTH - `OPCODE_WIDTH)
`define ADD `INSTRUCTION_WIDTH'd0
`define SUB `INSTRUCTION_WIDTH'd1
`define LD  `INSTRUCTION_WIDTH'd2
`define ST  `INSTRUCTION_WIDTH'd3
`define AND `INSTRUCTION_WIDTH'd4
`define OR  `INSTRUCTION_WIDTH'd5
`define XOR `INSTRUCTION_WIDTH'd6
`define NOP `INSTRUCTION_WIDTH'd7
`define NOT `INSTRUCTION_WIDTH'd8

`define R0 `REG_ADDR_WIDTH'd0
`define R1 `REG_ADDR_WIDTH'd1
`define R2 `REG_ADDR_WIDTH'd2
`define R3 2'd3

`define ASM(opcode, reg_addr) {opcode, reg_addr}
//`define ASM(opcode, reg_addr) {opcode[(`INSTRUCTION_WIDTH - 1):0], reg_addr[(`REG_ADDR_WIDTH - 1):0]}