`include "OpCodes.v"

module Processor(input clk, input [7:0] r3, output [7:0] acc);
    
    wire [4:0] program_counter;
    wire [(`INSTRUCTION_WIDTH - 1):0] instruction;
    wire [(`OPCODE_WIDTH - 1):0] opcode;
    wire [(`REG_ADDR_WIDTH - 1):0] reg_addr;
    wire [7:0] register;
    wire st_ce, ld_ce, cy_ce, acc_ce;

    PC pc(.CLK(clk), .counter(program_counter));
    ROM rom(.address(program_counter), .data(instruction));
    ID id(.instruction(instruction), .opcode(opcode), .reg_addr(reg_addr), .st_ce(st_ce), .ld_ce(ld_ce), .cy_ce(cy_ce), .acc_ce(acc_ce));
    RF rf(.clk(clk), .ld_ce(ld_ce), .st_ce(st_ce), .acc(acc), .debug_reg(r3), .addr(reg_addr), .data(register));
    ALU alu(.clk(clk), .alu_ce(acc_ce), .cy_ce(cy_ce), .opcode(opcode), .register(register), .acc(acc));

    always @(posedge clk) begin
    end

endmodule
