//`timescale 1ns / 100ps

//`include OpCodes.v

module Processor_tb;

//Internal signals declarations:
reg clk;
reg [7:0] r3;
wire [7:0] acc;
wire cy;

// Instantiate the Processor module
Processor processor(.clk(clk), .r3(r3), .acc(acc), .cy(cy));

// initial	begin
// 	clk = 1'b0;
// 	forever #5 clk = ~clk;
// end

// initial	begin
// 	WAIT(800);
// 	$display("@%d: Simulation completed.", $time);
// 	$finish;
// end

initial begin
    $dumpfile("Processor_tb.vcd");
    $dumpvars(0, Processor_tb);
    // $dumpvars(0, rom);
    // $dumpvars(0, pc);
    // $dumpvars(0, id);
    // $dumpvars(0, rf);
    // $dumpvars(0, alu);
    $display("Starting simulation");
end

task CLK_CYCLE;
    begin
        #10 clk = ~clk;
    end
endtask

integer i;
// Addition test
initial begin
    clk = 1'b0;

    r3 = 8'd6;

    for (i = 0; i < 32; i = i + 1) begin
        CLK_CYCLE;
    end
    //assert
    $finish;
end

endmodule
    


