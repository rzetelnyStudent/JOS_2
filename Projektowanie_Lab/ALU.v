`include "OpCodes.v"

module ALU(
    input clk, input alu_ce, input cy_ce, input [(`OPCODE_WIDTH - 1):0] opcode, input [7:0] register, 
    input [(`ARG_WIDTH - 1):0] argument,
    output reg [7:0] acc, output reg cy, output reg [(`ARG_WIDTH - 1):0] jmp_addr_temp, output reg jmp_ce_temp);

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
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `SUB: begin
                {cy_temp, acc_temp} = acc - register;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `LD: begin
                acc_temp = register;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `AND: begin
                acc_temp = acc & register;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `OR: begin
                acc_temp = acc | register;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `XOR: begin
                acc_temp = acc ^ register;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `NOT: begin
                acc_temp = ~register;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
            `JMP: begin
                acc_temp = acc;
                cy_temp = 1'b0;
                jmp_addr_temp = argument;
                jmp_ce_temp = 1'b1;
            end
            `JZ: begin
                acc_temp = acc;
                cy_temp = 1'b0;
                if (acc == `ARG_WIDTH'b0) begin
                    jmp_addr_temp = argument;
                    jmp_ce_temp = 1'b1;
                end
                else begin
                    jmp_addr_temp = `ARG_WIDTH'b0;
                    jmp_ce_temp = 1'b0;
                end
            end
            default: begin
                acc_temp = acc;
                cy_temp = 1'b0;
                jmp_addr_temp = `ARG_WIDTH'b0;
                jmp_ce_temp = 1'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        acc <= acc_temp;
        cy <= cy_temp;
    end
endmodule