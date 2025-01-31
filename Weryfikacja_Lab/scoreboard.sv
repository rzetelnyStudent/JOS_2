`include "interface.sv"

class scoreboard;
  
  virtual AluInterface aluInt;
  
  function new(virtual AluInterface aluInt);
    this.aluInt = aluInt;
  endfunction;
  
      // Format function
  task MyAssert(string var_name, bit [31:0] actual, bit [31:0] expected);
      begin
        if (expected === actual) begin
            $display("%s: match", var_name);
        end else begin
            $display("%s: fail, actual: %0d, expected: %0d", var_name, actual, expected);
        end
      end
    endtask
  
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
  
  task displayTestData(input [2:0] opcode, input [1:0] src, input cin, input acc, input rhs);
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