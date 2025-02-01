`include "interface.sv"

// Class responsible for displaying test data and checking the results
class scoreboard;
  
  virtual AluInterface aluInt;
  
  // Constructor for the scoreboard class
  function new(virtual AluInterface aluInt);
    this.aluInt = aluInt;
  endfunction;
  
  // Task to display the test data and information if they match or not. Displays the var_name actual and expected values.
  task MyAssert(string var_name, bit [31:0] actual, bit [31:0] expected);
      begin
        if (expected === actual) begin
          $display("%s: match: %0d", var_name, actual);
        end else begin
            $display("%s: fail, actual: %0d, expected: %0d", var_name, actual, expected);
        end
      end
    endtask
  
  // Function to display the instruction name mathematical symbol based on the opcode.
  function string displayInstructionName(input [2:0] opcode);
    begin
      case (opcode)
        `LD:   displayInstructionName = ("Load");
        `ADD: displayInstructionName = ("+");
        `SUB:  displayInstructionName = ("-");
        `NOT:  displayInstructionName = ("~");
        `AND: displayInstructionName = ("&");
        `OR:  displayInstructionName = ("|");
        `XOR:  displayInstructionName = ("^");
        default: displayInstructionName = ("Unknown instruction");
      endcase
    end
  endfunction
  
  // Task to display the input test data based on the opcode and source.
  task displayTestData(input [2:0] opcode, input [1:0] src, input cin, input [7:0] acc, input [7:0] rhs);
    begin
      case (src)
        2'b00: $display("acc: %d, MEM_ADDR: %d, cin: %d, op: %s", acc, rhs, cin, displayInstructionName(opcode));
        2'b01: $display("acc: %d, IMM: %d, cin: %d, op: %s", acc, rhs, cin, displayInstructionName(opcode));
        2'b10: $display("acc: %d, INDIR: %d, cin: %d, op: %s", acc, rhs, cin, displayInstructionName(opcode));
        2'b11: $display("acc: %d, REG: %d, cin: %d, op: %s", acc, rhs, cin, displayInstructionName(opcode));
        default: $display("Invalid src: %d", src);
      endcase
    end
  endtask
  
  // Task to check the data. Compares the actual and expected values. Displays the input test data and the results.
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
      displayTestData(op, src, cin, lhs, rhs);
      MyAssert("Acc", aluInt.acc_v, outp);
      MyAssert("Cout", aluInt.flag_cy, cout);
      MyAssert("Zero flag", aluInt.flag_z, zeroFlag);
    end
  endtask
  
endclass