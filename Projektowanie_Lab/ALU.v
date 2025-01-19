`include "OpCodes.v"

// ALU implementation module. ALU is designed to work with clock cycle = instruction cycle architecture.
// ALU reacts to clock rising edge. Calculation result (outputs acc and cy) is available after every rising edge of the clock signal.
// When the CY flag is set, it is cleared after next rising edge of the clock signal.
// jmp_addr_temp and jmp_ce_temp are combinational outputs, which are produced from latched ACC value and opcode input.
// They are intended to be read on the next rising edge of the clock signal. This is necessary for clock cycle = instruction cycle architecture.
module ALU(
    input clk,      // Main clock signal
    input alu_ce,   // ALU enable signal (in fact - not used, since ALU activates itself according to opcode)
    input cy_ce,    // Carry-out enable signal (in fact - not used, since CY activation condition is hardcoded in ALU)
    input [(`OPCODE_WIDTH - 1):0] opcode,       // Opcode input
    input [7:0] register,                       // Value of a selected Register
    input [(`ARG_WIDTH - 1):0] argument,        // Instruction argument input
    output reg [7:0] acc,                       // Accumulator output (latched value)
    output reg cy,                              // Carry-out flag output (latched value)
    output reg [(`ARG_WIDTH - 1):0] jmp_addr_temp,  // Jump address output (combinational) 
    output reg jmp_ce_temp                      // Jump enable signal output (combinational). Indicates that a jump is required
);

    reg [7:0] acc_temp;     // Temporary (combinational) accumulator value
    reg cy_temp;        // Temporary (combinational) carry-out flag value

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