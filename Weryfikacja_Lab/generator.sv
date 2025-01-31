`include "OpCodes.svh"
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
        rhs = $urandom;
        //rhs = 3;
      end
  	endtask



endclass