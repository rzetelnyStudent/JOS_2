`include "enums.svh"
`include "OpCodes.svh"

// Class responsible for modelling ALU operations
class Model;
  
  logic [7:0] acc = 0;
  logic cin = 0;
  
  // Task to perform ALU operation, based on the opcode. Updates the output, carry-out, and zero flag.
  task DoOperation(
    input [2:0] op,
    output cin_out,
    output [7:0] lhs,
    input [7:0] rhs,
    output reg [7:0] outp,
    output reg cout,
    output reg zeroFlag
  );
    reg [8:0] temp; // Temporary register to hold intermediate results
    begin
      lhs = acc;
      cin_out = cin;
      case (op)
        `LD: begin
          outp = rhs;
          cout = 0;
        end
        `ADD: begin
          temp = acc + rhs + cin;
          outp = temp[7:0];
          cout = temp[8];
        end
        `SUB: begin
          temp = acc - rhs - cin;
          outp = temp[7:0];
          cout = temp[8];
        end
        `NOT: begin
          outp = ~acc;
          cout = 0;
        end
        `AND: begin
          outp = acc & rhs;
          cout = 0;
        end
        `OR: begin
          outp = acc | rhs;
          cout = 0;
        end
        `XOR: begin
          outp = acc ^ rhs;
          cout = 0;
        end
        default: begin
          outp = 8'b0;
          cout = 0;
        end
      endcase
      zeroFlag = (outp == 8'b0);
      acc = outp;
      cin = cout;
    end
  endtask
  
endclass