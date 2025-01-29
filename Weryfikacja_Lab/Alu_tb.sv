`include "enums.svh"
`include "environment.sv"
module Alu_tb;
  	logic ccc;

    generator gen;
    scoreboard scb;
  //environment env;

    logic clk;
    bit aresetn;

    // Declare the signals for the alu_acc_flags module
    logic rst;
    data_src_t data_src;
    logic [7:0] immediate;
    logic [7:0] reg_out;
    logic [7:0] mem_out;
    logic [2:0] op;
    logic ce_a;
    logic ce_cy;
    logic [7:0] alu_in;
    logic [7:0] acc_v;
    logic flag_cy;
    logic flag_z;
    logic flag_s;
    logic flag_o;

    alu_acc_flags alu_dut (
        .rst(rst),
        .clk(clk),
        .data_src(data_src),
        .immediate(immediate),
        .reg_out(reg_out),
        .mem_out(mem_out),
        .op(op),
        .ce_a(ce_a),
        .ce_cy(ce_cy),
        .alu_in(alu_in),
        .acc_v(acc_v),
        .flag_cy(flag_cy),
        .flag_z(flag_z),
        .flag_s(flag_s),
        .flag_o(flag_o)
    );

    initial begin
        $dumpfile("Alu_tb.vcd");
        $dumpvars(0, Alu_tb);
        $display("Starting simulation");
    end

    initial begin
    	gen = new();
    	scb = new();
      //env.run_tests(rst, clk, data_src, immediate, reg_out, mem_out, op, ce_a, ce_cy);
   		gen.run_test_add(rst, clk, data_src, immediate, reg_out, mem_out, op, ce_a, ce_cy);
      	#10;      	

    end

endmodule