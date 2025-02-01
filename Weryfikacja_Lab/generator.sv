`include "OpCodes.svh"
`include "enums.svh"
`include "interface.sv"

// Class responsible for generating test data
class generator;

  virtual AluInterface aluInt;    // Virtual interface for ALU operations
  
  // Constructor for the generator class
  function new(virtual AluInterface aluInt);
    this.aluInt = aluInt;
  endfunction;
  
    // Task to get test data (rhs operand) for the ALU. Returns random value.
    task GetDataTest(
      output reg [7:0] rhs
    );
      begin
        rhs = $urandom;
        //rhs = 3;
      end
  	endtask
  
  // Task to load the accumulator with a value val.
  task loadAcc(input [7:0] val);
    begin
      aluInt.ce_a = 1;
      aluInt.data_src = SRC_REG;
      aluInt.reg_out = val;
      aluInt.op = `LD;
    end
  endtask
    



endclass