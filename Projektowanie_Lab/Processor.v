`include "OpCodes.v"

module Processor(input clk, input [7:0] r3, output [7:0] acc, output cy);
    
    wire [(`ARG_WIDTH - 1):0] program_counter;
    wire [(`INSTRUCTION_WIDTH - 1):0] instruction;
    wire [(`OPCODE_WIDTH - 1):0] opcode;
    wire [(`REG_ADDR_WIDTH - 1):0] reg_addr;
    wire [(`ARG_WIDTH - 1):0] argument;
    wire [(`ARG_WIDTH - 1):0] jmp_addr;
    wire [(`ARG_WIDTH - 1):0] register;
    wire st_ce, ld_ce, cy_ce, acc_ce, jmp_ce;

    PC pc(.CLK(clk), .counter(program_counter), .pc_set(jmp_ce), .pc_set_addr(jmp_addr));
    ROM rom(.address(program_counter), .data(instruction));
    ID id(.instruction(instruction), .opcode(opcode), .reg_addr(reg_addr), .arg(argument), .st_ce(st_ce), .ld_ce(ld_ce), .cy_ce(cy_ce), .acc_ce(acc_ce));
    RF rf(.clk(clk), .ld_ce(ld_ce), .st_ce(st_ce), .acc(acc), .debug_reg(r3), .addr(reg_addr), .data(register));
    ALU alu(.clk(clk), .alu_ce(acc_ce), .cy_ce(cy_ce), .opcode(opcode), .register(register), .argument(argument), .acc(acc), .cy(cy), .jmp_addr_temp(jmp_addr), .jmp_ce_temp(jmp_ce));

    always @(posedge clk) begin
    end

endmodule
