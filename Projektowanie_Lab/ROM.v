`include "OpCodes.v"

module ROM (input [(`ARG_WIDTH - 1):0] address, output [(`INSTRUCTION_WIDTH - 1):0] data);

    reg [(`INSTRUCTION_WIDTH - 1):0] memory [31:0];

    initial begin
        memory[0]  = `ASM_REG(`LD, `R3);
        memory[1]  = `ASM_REG(`ST, `R2);
        memory[2]  = `ASM_REG(`ADD, `R2);
        memory[3]  = `ASM_REG(`SUB, `R3);
        memory[4]  = `ASM(`NOP);
        memory[5]  = `ASM_REG(`XOR, `R3);
        memory[6]  = `ASM_REG(`SUB, `R2);
        memory[7]  = `ASM_ARG(`JZ, `ARG_WIDTH'd0);
        memory[8]  = `ASM_REG(`LD, `R1);
        memory[9]  = `ASM_REG(`XOR, `R1);   // zero
        memory[10] = `ASM_ARG(`JZ, `ARG_WIDTH'd12);
        memory[11] = `ASM_REG(`ADD, `R1);
        memory[12] = `ASM_ARG(`JZ, `ARG_WIDTH'd0);
        memory[13] = `ASM(`NOP);
        memory[14] = `ASM(`NOP);
        memory[15] = `ASM(`NOP);
        memory[16] = `ASM(`NOP);
        memory[17] = `ASM(`NOP);
        memory[18] = `ASM(`NOP);
        memory[19] = `ASM(`NOP);
        memory[20] = `ASM(`NOP);
        memory[21] = `ASM(`NOP);
        memory[22] = `ASM(`NOP);
        memory[23] = `ASM(`NOP);
        memory[24] = `ASM(`NOP);
        memory[25] = `ASM(`NOP);
        memory[26] = `ASM(`NOP);
        memory[27] = `ASM(`NOP);
        memory[28] = `ASM(`NOP);
        memory[29] = `ASM(`NOP);
        memory[30] = `ASM(`NOP);
        memory[31] = `ASM(`NOP);
    end

        assign data = memory[address];

endmodule