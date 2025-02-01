`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

`include "enums.svh"
`include "generator.sv"
`include "scoreboard.sv"
`include "model.sv"

class environment;
  
  virtual AluInterface aluInt;  
  generator gen;
  scoreboard scb;
  Model model;

  
  function new(virtual AluInterface aluInt);
    this.aluInt = aluInt;
    gen = new(aluInt);
    scb = new(aluInt);
    model = new();
  endfunction;
  
  task GetDataTest( 
    input [2:0] op,
    output cin,
    output [7:0] lhs,
    output [7:0] rhs,
    output [7:0] outp,
    output cout,
    output zeroFlag);
    begin
      gen.GetDataTest(rhs);
      model.DoOperation(op, cin, lhs, rhs, outp, cout, zeroFlag);
    end
  endtask
  
  task CheckData(
      input [2:0] op,
      input cin,    
      input [1:0] src, 
      input [7:0] lhs,
      input [7:0] rhs,
      input [7:0] outp,
      input cout,
      input zeroFlag);
    begin
      scb.CheckData(op, cin, src, lhs, rhs, outp, cout, zeroFlag);
    end
  endtask

endclass

`endif
