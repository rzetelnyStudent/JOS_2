`include "OpCodes.svh"
`include "enums.svh"
`include "interface.sv"

class generator;

  virtual AluInterface aluInt;
  
  function new(virtual AluInterface aluInt);
    this.aluInt = aluInt;
  endfunction;
  
    task GetDataTest(
      output reg [7:0] rhs
    );
      begin
        //rhs = $urandom;
        rhs = 3;
      end
  	endtask
  
  task loadAcc(input [7:0] val);
    begin
      aluInt.ce_a = 1;
      aluInt.data_src = SRC_REG;
      aluInt.reg_out = val;
      aluInt.op = `LD;
    end
  endtask
    



endclass