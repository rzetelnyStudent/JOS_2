`include "OpCodes.v"

module ALU(
    input clk, input alu_ce, input cy_ce, input [(`OPCODE_WIDTH - 1):0] opcode, input [7:0] register,
    output reg [7:0] acc, output reg cy);

    initial begin
        acc = 8'b0;
        cy = 1'b0;
    end

    always @(negedge clk) begin
        if (alu_ce) begin
            case (opcode)
                `ADD: begin
                    {cy, acc} = acc + register;
                end
                `SUB: begin
                    {cy, acc} = acc - register;
                end
                `LD: begin
                    acc = register;
                    cy = 1'b0;
                end
                `AND: begin
                    acc = acc & register;
                    cy = 1'b0;
                end
                `OR: begin
                    acc = acc | register;
                    cy = 1'b0;
                end
                `XOR: begin
                    acc = acc ^ register;
                    cy = 1'b0;
                end
                `NOT: begin
                    acc = ~register;
                    cy = 1'b0;
                end
                default: begin
                    acc = acc;
                    cy = 1'b0;
                end
            endcase
        end
        else begin
            cy <= 1'b0;
        end


    end
endmodule