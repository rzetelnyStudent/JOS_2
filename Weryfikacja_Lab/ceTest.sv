`include "environment.sv"

// Program to test the CE operation on ALU
program CeTest(AluInterface intf);
  environment env;   // Environment instance
  
  // Main program block
  initial begin
    env = new(intf);
    
      // Wait for the previous tests to complete
      #3;
      #497;
    
      #3;
      #497;

      #3;   // Wait for the reset to complete
    
      $display("CE test started");

      ///////////// Test 1: Disable the ALU and check if the accumulator value remains the same /////////////
      
      intf.ce_a = 0;   // Disable the ALU
      intf.ce_cy = 0;
      
      // Load the accumulator with a value
      env.gen.loadAcc(5);
      #5;
      env.scb.MyAssert("Loading acc", intf.acc_v, 5);
      #5;
    
      // Prepare for addition, but disable the ALU
      intf.ce_a = 0;
      intf.ce_cy = 1;
      intf.data_src = SRC_REG;
      intf.reg_out = 3;
      intf.op = `ADD;
    
      // Check if the accumulator value remains the same
      #5;
      env.scb.MyAssert("acc value", intf.acc_v, 5);
      #5;
    
      ///////////// Test 2: Disable the ALU, but enable the cy flag, and check if the carry flag not triggers /////////////
      env.gen.loadAcc(255);
      #5;
      env.scb.MyAssert("Loading acc", intf.acc_v, 255);
      #5;

      // Prepare for addition, 255 + 2, alu disabled flags enabled
      intf.ce_a = 0;
      intf.ce_cy = 1;
      intf.data_src = SRC_REG;
      intf.reg_out = 2;
      intf.op = `ADD;
    
      #5;
      env.scb.MyAssert("Acc", intf.acc_v, 255);
      env.scb.MyAssert("CY flag", intf.flag_cy, 0);
      #5;
    
      ///////////// Test 3: Enable the ALU and flag and check if the accumulator value and flag change /////////////
      env.gen.loadAcc(255);
      #5;
      env.scb.MyAssert("Loading acc", intf.acc_v, 255);
      #5;
    
      // Prepare for addition, 255 + 2, alu and flags enabled
      intf.ce_a = 1;
      intf.ce_cy = 1;
      intf.data_src = SRC_REG;
      intf.reg_out = 2;
      intf.op = `ADD;
    
      #5;
      env.scb.MyAssert("Acc", intf.acc_v, 1);
      env.scb.MyAssert("CY flag", intf.flag_cy, 1);
      #5;
    end
endprogram