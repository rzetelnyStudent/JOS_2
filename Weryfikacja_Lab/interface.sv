`ifndef INTERFACE_SV
`define INTERFACE_SV

`include "enums.svh"

interface AluInterface #(parameter int WIDTH = 8);
  logic rst;                   // async reset
  logic clk;                   // clock
  data_src_t data_src;   		 // data source (?0 - mem, 01 - imm, 11 - reg)
  logic [WIDTH-1:0] immediate; // immediate value
  logic [WIDTH-1:0] reg_out;   // value from register
  logic [WIDTH-1:0] mem_out;   // value from memory
  logic [2:0] op;              // ALU operation
  logic ce_a;                  // clock-enable for accumulator and flags
  logic ce_cy;                 // clock-enable for carry
  logic [WIDTH-1:0] alu_in;   // data from alu_in_mux - whatever goes to ALU (comb)
  logic [WIDTH-1:0] acc_v;    // accumulator value (registered)
  logic flag_cy;              // carry flag (registered)
  logic flag_z;               // zero flag (registered as a part of accumulator)
  logic flag_s;               // sign flag (comb: f(acc) = acc == 0)
  logic flag_o;                // overflow flag (registered)
  
  modport GenExtended(output data_src, output immediate, output reg_out, output mem_out, output op, output ce_a, output ce_cy);
  
  modport GenReg(output data_src, output reg_out, output op, output ce_a);
  
  modport GenImm(output data_src, output immediate, output op);
  
  modport GenMem(output data_src, output mem_out, output op);
  
  modport Scb(input acc_v, input flag_cy, input flag_z, input flag_s, input flag_o);
  
  
endinterface

`endif