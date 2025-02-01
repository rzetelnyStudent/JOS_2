`include "environment.sv"

program ResetTest(AluInterface intf);
  environment env;
  
  initial begin
    env = new(intf);
    
      #3;
      #497;
    
      #3;
    
    $display("Reset test started");
      
      aluInt.ce_a = 1;
      aluInt.ce_cy = 1;
      
    env.gen.loadAcc(5);
    #5;
    env.scb.MyAssert("Loading acc", intf.acc_v, 5);
    #5;
    
    // Prepare for addition
    aluInt.data_src = SRC_REG;
    aluInt.reg_out = 5;
    aluInt.op = `ADD;
    
    aluInt.rst = 1;
    #5;
    env.scb.MyAssert("acc reset", intf.acc_v, 0);
    #5;

  end
endprogram