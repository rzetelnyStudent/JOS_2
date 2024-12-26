`define OPCODE_WIDTH 4
`define REG_ADDR_WIDTH 2
`define ARG_WIDTH 8
`define INSTRUCTION_WIDTH (`OPCODE_WIDTH + `REG_ADDR_WIDTH + `ARG_WIDTH)

`define ADD `OPCODE_WIDTH'd0
`define SUB `OPCODE_WIDTH'd1
`define LD  `OPCODE_WIDTH'd2
`define ST  `OPCODE_WIDTH'd3
`define AND `OPCODE_WIDTH'd4
`define OR  `OPCODE_WIDTH'd5
`define XOR `OPCODE_WIDTH'd6
`define NOP `OPCODE_WIDTH'd7
`define NOT `OPCODE_WIDTH'd8
`define JMP `OPCODE_WIDTH'd9
`define JZ  `OPCODE_WIDTH'd10

`define R0 `REG_ADDR_WIDTH'd0
`define R1 `REG_ADDR_WIDTH'd1
`define R2 `REG_ADDR_WIDTH'd2
`define R3 `REG_ADDR_WIDTH'd3

`define ASM(opcode) {opcode, `REG_ADDR_WIDTH'd0, `ARG_WIDTH'd0}
`define ASM_REG(opcode, reg_addr) {opcode, reg_addr, `ARG_WIDTH'd0}
`define ASM_ARG(opcode, arg) {opcode, `REG_ADDR_WIDTH'd0, arg}
`define ASM_REG_ARG(opcode, reg_addr, arg) {opcode, reg_addr, arg}
