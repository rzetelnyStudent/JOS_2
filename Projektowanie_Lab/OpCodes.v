`define OPCODE_WIDTH 4
`define REG_ADDR_WIDTH 2
`define ARG_WIDTH 8
`define INSTRUCTION_WIDTH (`OPCODE_WIDTH + `REG_ADDR_WIDTH + `ARG_WIDTH)

// Instructions are stacked as follows:
// |      OPCODE      | REG_ADDR |            ARG           |
// |      4 bits      |  2 bits  |      8 bits (0-255)      |
// Where OPCODE is the operation code to be performed, 
// REG_ADDR is the address of the register in register file to be used,
// ARG is the argument value to be used.
// Different instructions are pre-defined to use REG_ADDR and/or ARG as follows
// (ACC - Accumulator latched value, REG - Register, ARG - Argument): 
`define ADD `OPCODE_WIDTH'd0    // ACC <= ACC + REG[REG_ADDR], Carry-out flag set if overflow
`define SUB `OPCODE_WIDTH'd1    // ACC <= ACC - REG[REG_ADDR], Carry-out flag set if underflow
`define LD  `OPCODE_WIDTH'd2    // ACC <= REG[REG_ADDR]
`define ST  `OPCODE_WIDTH'd3    // REG[REG_ADDR] <= ACC
`define AND `OPCODE_WIDTH'd4    // ACC <= ACC & REG[REG_ADDR]
`define OR  `OPCODE_WIDTH'd5    // ACC <= ACC | REG[REG_ADDR]
`define XOR `OPCODE_WIDTH'd6    // ACC <= ACC ^ REG[REG_ADDR]
`define NOP `OPCODE_WIDTH'd7    // No operation
`define NOT `OPCODE_WIDTH'd8    // ACC <= ~REG[REG_ADDR]
`define JMP `OPCODE_WIDTH'd9    // Unconditional jump to ARG address
`define JZ  `OPCODE_WIDTH'd10   // Jump to ARG address if ACC is zero

`define R0 `REG_ADDR_WIDTH'd0
`define R1 `REG_ADDR_WIDTH'd1
`define R2 `REG_ADDR_WIDTH'd2
`define R3 `REG_ADDR_WIDTH'd3

`define ASM(opcode) {opcode, `REG_ADDR_WIDTH'd0, `ARG_WIDTH'd0}
`define ASM_REG(opcode, reg_addr) {opcode, reg_addr, `ARG_WIDTH'd0}
`define ASM_ARG(opcode, arg) {opcode, `REG_ADDR_WIDTH'd0, arg}
`define ASM_REG_ARG(opcode, reg_addr, arg) {opcode, reg_addr, arg}
