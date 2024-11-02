`include "OpCodes.v"

module ROM (input [4:0] address, output [(`INSTRUCTION_WIDTH - 1):0] data);

    reg [(`INSTRUCTION_WIDTH - 1):0] memory [31:0];

    initial begin
        memory[0]  = `ASM(`ADD, `R3);
        memory[1]  = `ASM(`ADD, `R3);
        memory[2]  = `ASM(`NOP, `R0);
        memory[3]  = `ASM(`NOP, `R0);
        memory[4]  = `ASM(`NOP, `R0);
        memory[5]  = `ASM(`NOP, `R0);
        memory[6]  = `ASM(`NOP, `R0);
        memory[7]  = `ASM(`NOP, `R0);
        memory[8]  = `ASM(`NOP, `R0);
        memory[9]  = `ASM(`NOP, `R0);
        memory[10] = `ASM(`NOP, `R0);
        memory[11] = `ASM(`NOP, `R0);
        memory[12] = `ASM(`NOP, `R0);
        memory[13] = `ASM(`NOP, `R0);
        memory[14] = `ASM(`NOP, `R0);
        memory[15] = `ASM(`NOP, `R0);
        memory[16] = `ASM(`NOP, `R0);
        memory[17] = `ASM(`NOP, `R0);
        memory[18] = `ASM(`NOP, `R0);
        memory[19] = `ASM(`NOP, `R0);
        memory[20] = `ASM(`NOP, `R0);
        memory[21] = `ASM(`NOP, `R0);
        memory[22] = `ASM(`NOP, `R0);
        memory[23] = `ASM(`NOP, `R0);
        memory[24] = `ASM(`NOP, `R0);
        memory[25] = `ASM(`NOP, `R0);
        memory[26] = `ASM(`NOP, `R0);
        memory[27] = `ASM(`NOP, `R0);
        memory[28] = `ASM(`NOP, `R0);
        memory[29] = `ASM(`NOP, `R0);
        memory[30] = `ASM(`NOP, `R0);
        memory[31] = `ASM(`NOP, `R0);
    end

        assign data = memory[address];

endmodule