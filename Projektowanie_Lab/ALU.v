`include "OpCodes.v"

module ALU(
    input clk, input alu_ce, input cy_ce, input [(`OPCODE_WIDTH - 1):0] opcode, input [7:0] register,
    output reg [7:0] acc, output reg cy);

    reg [7:0] acc_temp;
    reg cy_temp;

    initial begin
        acc = 8'b0;
        acc_temp = 8'b0;
        cy = 1'b0;
    end

    always @(*) begin
        case (opcode)
            `ADD: begin
                {cy_temp, acc_temp} = acc + register;
            end
            `SUB: begin
                {cy_temp, acc_temp} = acc - register;
            end
            `LD: begin
                acc_temp = register;
                cy_temp = 1'b0;
            end
            `AND: begin
                acc_temp = acc & register;
                cy_temp = 1'b0;
            end
            `OR: begin
                acc_temp = acc | register;
                cy_temp = 1'b0;
            end
            `XOR: begin
                acc_temp = acc ^ register;
                cy_temp = 1'b0;
            end
            `NOT: begin
                acc_temp = ~register;
                cy_temp = 1'b0;
            end
            default: begin
                acc_temp = acc;
                cy_temp = 1'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        acc <= acc_temp;
        cy <= cy_temp;
    end
endmodule