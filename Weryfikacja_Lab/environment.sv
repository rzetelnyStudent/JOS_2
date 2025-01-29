`include "enums.svh"
`include "generator.sv"
`include "scoreboard.sv"

class environment;
    generator gen;
    scoreboard scb;

function new();
    gen = new();
    scb = new();
endfunction

task run_tests(
    output rst,                   // async reset
    output clk,                   // clock
    output data_src_t data_src,   // data source (?0 - mem, 01 - imm, 11 - reg)
    output [7:0] immediate, // immediate value
    output [7:0] reg_out,   // value from register
    output [7:0] mem_out,   // value from memory
    output [2:0] op,              // ALU operation
    output ce_a,                  // clock-enable for accumulator and flags
    output ce_cy                  // clock-enable for carry
    );
begin
    //gen.run_test_add(rst, clk, data_src, immediate, reg_out, mem_out, op, ce_a, ce_cy);
  
  rst = 0;
  clk = 1;

end
endtask

endclass