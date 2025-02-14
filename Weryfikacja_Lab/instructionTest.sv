`include "environment.sv"

// Program to test the operations on instruction set
program InstructionTest(AluInterface intf);
  environment env;      // Environment instance
  
  integer opCode = 1;   // Opcode of the instruction
  integer src = 0;    // Source of the data
  
  // Signals for the ALU model
  logic [1:0] data_src;
  logic [2:0] op_code;
  logic [7:0] lhs;
  logic [7:0] rhs;
  logic [7:0] outp;
  logic cout;
  logic cin;
  logic zeroFlag;
  
  // Main program block
  initial begin
    env = new(intf);
    
    #3;     // Wait for the reset to complete
    
    $display("Instruction test started");
        
        // Enable the ALU and flags
        aluInt.ce_a = 1;
        aluInt.ce_cy = 1;
        
        // Loop through all the instructions and data sources. Every time, get the 
        // random data from the generator and perform the operation. Then, check the
        // result using the scoreboard.
        for (opCode = 1; opCode < 8; opCode = opCode + 1) begin
            for (src = 0; src < 4; src = src + 1) begin
                op_code = opCode[2:0];
                data_src = src[1:0];          
                env.GetDataTest(op_code, cin, lhs, rhs, outp, cout, zeroFlag);
                aluInt.data_src = data_src_t'(data_src);
                case (aluInt.data_src)
                SRC_MEM_ADDR: begin
                    aluInt.mem_out = rhs;
                    aluInt.immediate = 0;
                    aluInt.reg_out = 0;
                end
                SRC_IMMEDIATE: begin
                    aluInt.mem_out = 0;
                    aluInt.immediate = rhs;
                    aluInt.reg_out = 0;
                end
                SRC_INDIRECT: begin
                    aluInt.mem_out = rhs;
                    aluInt.immediate = 0;
                    aluInt.reg_out = 0;
                end
                SRC_REG: begin
                    aluInt.mem_out = 0;
                    aluInt.immediate = 0;
                    aluInt.reg_out = rhs;
                end
                endcase;
                #5;
                env.CheckData(op_code, cin, data_src, lhs, rhs, outp, cout, zeroFlag);
                #5;
            end
        end
  end
endprogram