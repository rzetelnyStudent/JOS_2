`include "OpCodes.v"

module RF(
    input clk,
    input ld_ce,
    input st_ce,
    input [7:0] acc,
    input [7:0] debug_reg, 
    input [(`REG_ADDR_WIDTH - 1):0] addr, 
    output reg [7:0] data);

    reg [7:0] registers [3:0];

    always @(posedge clk) begin
        if (ld_ce) begin
            if (addr == `R3) begin
                data <= debug_reg;
            end
            else begin
                data <= registers[addr];
            end
        end

        if (st_ce) begin
            registers[addr] <= acc;
        end
    end

endmodule