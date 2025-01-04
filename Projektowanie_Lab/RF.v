`include "OpCodes.v"

// Register File module
module RF(
    input clk,              // Main clock signal
    input ld_ce,            // Load enable signal
    input st_ce,            // Store enable signal
    input [7:0] acc,        // Accumulator input
    input [7:0] debug_reg,  // Debug register (R3) input
    input [(`REG_ADDR_WIDTH - 1):0] addr,  // Register address selector input
    output [7:0] data
);

    reg [7:0] registers [3:0];

    initial begin
        registers[0] = 8'b0;
        registers[1] = 8'b0;
        registers[2] = 8'b0;
        registers[3] = 8'b0;
    end

    assign data = (addr == `R3) ? debug_reg : registers[addr];

    always @(posedge clk) begin
        if (st_ce) begin
            registers[addr] <= acc;
        end
    end

endmodule