`include "environment.sv"

// Program to test the reset operation on ALU
program ResetTest(AluInterface intf);
  environment env;     // Environment instance
  
  initial begin
    env = new(intf);
    
      // Wait for the previous test to complete
      #3;
      #497;
    
      #3;   // Wait for the reset to complete
    
      $display("Reset test started");
      
      // Enable the ALU and flags
      aluInt.ce_a = 1;
      aluInt.ce_cy = 1;
      
      // Load the accumulator with a value
      env.gen.loadAcc(5);
      #5;
      env.scb.MyAssert("Loading acc", intf.acc_v, 5);
      #5;
    
      // Prepare for the addition operation
      aluInt.data_src = SRC_REG;
      aluInt.reg_out = 5;
      aluInt.op = `ADD;
    
      // But trigger the reset instead of an operation    
      aluInt.rst = 1;
      #5;
      env.scb.MyAssert("acc reset", intf.acc_v, 0);     // Check if accumulator is reset, i.e., 0
      #5;

  end
endprogram