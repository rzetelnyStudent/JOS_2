`include "OpCodes.v"

module PC (
    input CLK,        // Clock input
    input pc_set,
    input [(`ARG_WIDTH - 1):0] pc_set_addr,
    output reg [(`ARG_WIDTH - 1):0] counter
);

    // Initialize the counter to 0
    initial begin
        counter = `ARG_WIDTH'd0;
    end

    always @(posedge CLK) begin
        if (pc_set) begin
            counter <= pc_set_addr;
        end 
        else begin
            counter <= counter + `ARG_WIDTH'd1;
        end
    end

endmodule