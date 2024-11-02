`include "OpCodes.v"

module ROM (input [4:0] address, output [(`INSTRUCTION_WIDTH - 1):0] data);

    reg [(`INSTRUCTION_WIDTH - 1):0] memory [31:0];

    initial begin
        //`ASM(`ADD, `R3);
        memory[0]  = `ASM(4'b0000, 2'b00);
        memory[1]  = `INSTRUCTION_WIDTH'b000010;
        memory[2]  = `INSTRUCTION_WIDTH'b000011;
        memory[3]  = `INSTRUCTION_WIDTH'b000100;
        memory[4]  = `INSTRUCTION_WIDTH'b000101;
        memory[5]  = `INSTRUCTION_WIDTH'b000110;
        memory[6]  = `INSTRUCTION_WIDTH'b000111;
        memory[7]  = `INSTRUCTION_WIDTH'b001000;
        memory[8]  = `INSTRUCTION_WIDTH'b001001;
        memory[9]  = `INSTRUCTION_WIDTH'b001010;
        memory[10] = `INSTRUCTION_WIDTH'b001011;
        memory[11] = `INSTRUCTION_WIDTH'b001100;
        memory[12] = `INSTRUCTION_WIDTH'b001101;
        memory[13] = `INSTRUCTION_WIDTH'b001110;
        memory[14] = `INSTRUCTION_WIDTH'b001111;
        memory[15] = `INSTRUCTION_WIDTH'b010000;
        memory[16] = `INSTRUCTION_WIDTH'b010001;
        memory[17] = `INSTRUCTION_WIDTH'b010010;
        memory[18] = `INSTRUCTION_WIDTH'b010011;
        memory[19] = `INSTRUCTION_WIDTH'b010100;
        memory[20] = `INSTRUCTION_WIDTH'b010101;
        memory[21] = `INSTRUCTION_WIDTH'b010110;
        memory[22] = `INSTRUCTION_WIDTH'b010111;
        memory[23] = `INSTRUCTION_WIDTH'b011000;
        memory[24] = `INSTRUCTION_WIDTH'b011001;
        memory[25] = `INSTRUCTION_WIDTH'b011010;
        memory[26] = `INSTRUCTION_WIDTH'b011011;
        memory[27] = `INSTRUCTION_WIDTH'b011100;
        memory[28] = `INSTRUCTION_WIDTH'b011101;
        memory[29] = `INSTRUCTION_WIDTH'b011110;
        memory[30] = `INSTRUCTION_WIDTH'b011111;
        memory[31] = `INSTRUCTION_WIDTH'b100000;
    end

        assign data = memory[address];

endmodule