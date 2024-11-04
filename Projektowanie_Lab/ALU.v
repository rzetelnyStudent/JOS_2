`include "OpCodes.v"

module ALU(
    input clk, input alu_ce, input cy_ce, input [(`OPCODE_WIDTH - 1):0] opcode, input [7:0] register,
    output reg [7:0] acc);

    initial begin
        acc = 8'b0;
    end

    always @(negedge clk) begin
        if (alu_ce) begin
            case (opcode)
                `ADD: acc = acc + register;
                `SUB: acc = acc - register;
                `LD: acc = register;
                `AND: acc = acc & register;
                `OR: acc = acc | register;
                `XOR: acc = acc ^ register;
                `NOT: acc = ~register;
                default: acc = acc;
            endcase
        end
    end
endmodule