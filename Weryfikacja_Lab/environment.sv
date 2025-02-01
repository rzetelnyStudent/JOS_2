// Include guard to prevent multiple inclusions of this file
`ifndef ENVIRONMENT_SV
`define ENVIRONMENT_SV

// Include necessary header files
`include "enums.svh"
`include "generator.sv"
`include "scoreboard.sv"
`include "model.sv"

// Define the environment class
class environment;
  
  virtual AluInterface aluInt;   // Virtual interface for ALU operations
  generator gen;     // Generator instance for generating test data
  scoreboard scb;       // Scoreboard instance for checking results
  Model model;      // Model instance for performing operations


  // Constructor for the environment class
  function new(virtual AluInterface aluInt);
  this.aluInt = aluInt;
  gen = new(aluInt);
  scb = new(aluInt);
  model = new();
  endfunction;
  
  // Task to get test data and perform operation using the model
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
  
  // Task to check the data using the scoreboard
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