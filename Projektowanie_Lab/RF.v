`include "OpCodes.v"

module RF(
    input clk,
    input ld_ce,
    input st_ce,
    input [7:0] acc,
    input [7:0] debug_reg, 
    input [(`REG_ADDR_WIDTH - 1):0] addr, 
    output [7:0] data);

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