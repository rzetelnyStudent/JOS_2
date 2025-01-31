`include "enums.svh"
`include "environment.sv"
`include "interface.sv"
module Alu_tb;
  
  environment env;

  AluInterface aluInt();

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
    	#12 aluInt.rst = 0;
 	 end

    initial begin
        $dumpfile("Alu_tb.vcd");
        $dumpvars(0, Alu_tb);
        $display("Starting simulation");
    end
  
  integer opCode = 1;
  integer src = 0;
  
  logic [1:0] data_src;
  logic [2:0] op_code;
  logic [7:0] lhs;
  logic [7:0] rhs;
  logic [7:0] outp;
  logic cout;
  logic cin;
  logic zeroFlag;
  
  
  
    initial begin
      env = new(aluInt);
      #12;
      
      aluInt.ce_a = 1;
      aluInt.ce_cy = 1;
      
      for (opCode = 1; opCode < 8; opCode = opCode + 1) begin
        for (src = 0; src < 4; src = src + 1) begin
          op_code = opCode[2:0];
          data_src = src[1:0];          
          env.GetDataTest(op_code, cin, lhs, rhs, outp, cout, zeroFlag);
          aluInt.data_src = data_src_t'(data_src);
          case (aluInt.data_src)
            SRC_MEM_ADDR: aluInt.mem_out = rhs;
            SRC_IMMEDIATE: aluInt.immediate = rhs;
            SRC_INDIRECT: aluInt.mem_out = rhs;
            SRC_REG: aluInt.reg_out = rhs;
          endcase;
          #5;
          env.CheckData(op_code, cin, data_src, lhs, rhs, outp, cout, zeroFlag);
        end
      end

      #2000;
    end

endmodule