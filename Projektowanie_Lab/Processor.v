`include "OpCodes.v"

// Processor implementation module
module Processor(
    input clk,              // Main clock signal
    input [7:0] r3,         // Register R3 extracted as a debug input
    output [7:0] acc,       // Accumulator output
    output cy,              // Carry-out flag
    output [6:0] digit1,    // Program counter display digit 1
    output [6:0] digit0     // Program counter display digit 0
);
    
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

	 Hex_7seg_Verilog hex_segment1(.hex(program_counter / 10), .seg(digit1));
	 Hex_7seg_Verilog hex_segment0(.hex(program_counter % 10), .seg(digit0));


    always @(posedge clk) begin
    end

endmodule
