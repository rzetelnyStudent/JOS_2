`include "enums.svh"
`include "instructionTest.sv"
`include "resetTest.sv"
`include "ceTest.sv"
`include "interface.sv"


module Alu_tb;
  
  AluInterface aluInt();
  
  InstructionTest test1(aluInt);
  ResetTest test2(aluInt);
  CeTest test3(aluInt);


    alu_acc_flags alu_dut (
      .rst(aluInt.rst),
        .clk(aluInt.clk),
        .data_src(aluInt.data_src),
        .immediate(aluInt.immediate),
        .reg_out(aluInt.reg_out),
        .mem_out(aluInt.mem_out),
        .op(aluInt.op),
        .ce_a(aluInt.ce_a),
        .ce_cy(aluInt.ce_cy),
        .alu_in(aluInt.alu_in),
        .acc_v(aluInt.acc_v),
        .flag_cy(aluInt.flag_cy),
        .flag_z(aluInt.flag_z),
        .flag_s(aluInt.flag_s),
        .flag_o(aluInt.flag_o)
    );
  
    always #5 aluInt.clk = ~aluInt.clk;
  
    initial
  	begin
 		aluInt.clk = 0;
		aluInt.rst = 1;
    	#3 aluInt.rst = 0;
      
		#497;
      
      	aluInt.rst = 1;
    	#3 aluInt.rst = 0;
      
      	#497;
      
        aluInt.rst = 1;
    	#3 aluInt.rst = 0;
      
      	#497;
      
      
 	 end

    initial begin
        $dumpfile("Alu_tb.vcd");
        $dumpvars(0, Alu_tb);
        $display("Starting simulation");
    end

endmodule