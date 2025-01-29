`include "enums.svh"

class generator;

    function new();
    endfunction

    task CLK_TRANSITION(input clk);
    begin
        #10 clk = ~clk;
    end
    endtask

    task reset();
        // Reset the DUT
        //alu_dut.rst <= 1;
        //CLK_TRANSITION;
        //CLK_TRANSITION;
        // De-assert the reset signal
        //alu_dut.rst <= 0;
    endtask



    task run_test_add(
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
        reset();
          
        rst = 1;
          CLK_TRANSITION(clk);
        rst = 0;

        // Set the input values for the test
        data_src = SRC_REG; // reg
        immediate = 8'hFF;
        reg_out = 8'h00;
        mem_out = 8'h00;
        op = 3'b000; // add
        ce_a = 1;
        ce_cy = 1;
          
        CLK_TRANSITION(clk);
        rst = 0;
        end
    endtask



endclass