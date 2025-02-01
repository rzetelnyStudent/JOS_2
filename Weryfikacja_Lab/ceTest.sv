`include "environment.sv"

program CeTest(AluInterface intf);
  environment env;
  
  initial begin
    env = new(intf);
    
      #3;
      #497;
    
      #3;
      #497;
    
    $display("CE test started");
      
      intf.ce_a = 0;
      intf.ce_cy = 0;
      
    env.gen.loadAcc(5);
    #5;
    env.scb.MyAssert("Loading acc", intf.acc_v, 5);
    #5;
    
    intf.ce_a = 0;
    intf.ce_cy = 1;
    // Prepare for fake addition
    intf.data_src = SRC_REG;
    intf.reg_out = 3;
    intf.op = `ADD;
    
    #5;
    env.scb.MyAssert("acc value", intf.acc_v, 5);
    #5;
    
    env.gen.loadAcc(255);
    #5;
    env.scb.MyAssert("Loading acc", intf.acc_v, 255);
    #5;
    
    intf.ce_a = 0;
    intf.ce_cy = 1;
    intf.data_src = SRC_REG;
    intf.reg_out = 2;
    intf.op = `ADD;
    
    #5;
    env.scb.MyAssert("Acc", intf.acc_v, 255);
    env.scb.MyAssert("CY flag", intf.flag_cy, 0);
    #5;
    
    env.gen.loadAcc(255);
    #5;
    env.scb.MyAssert("Loading acc", intf.acc_v, 255);
    #5;
    
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