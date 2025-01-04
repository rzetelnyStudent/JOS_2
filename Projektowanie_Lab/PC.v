`include "OpCodes.v"

// Program Counter module
module PC (
    input CLK,              // Main clock signal
    input pc_set,           // Set the program counter to a specific address enable signal
    input [(`ARG_WIDTH - 1):0] pc_set_addr,     // Address to set the program counter to
    output reg [(`ARG_WIDTH - 1):0] counter     // Program counter current address output
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