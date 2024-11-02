`include "OpCodes.v"

module PC (
    input CLK,        // Clock input
    output reg [4:0] counter // 5-bit counter output
);

    // Initialize the counter to 0
    initial begin
        counter = 5'b00000;
    end

    // Always block triggered on the rising edge of the clock
    always @(posedge CLK) begin
        counter <= counter + 5'd1;
    end

endmodule