// Module to convert 4-bit hex to 7-segment display code
module Hex_7seg_Verilog(
	input [3:0] hex, 		// 4-bit hex input
	output reg [6:0] seg	// 7-bit 7-segment display output
);

always @(*)
	case(hex)
		4'b0000: seg <= 7'b0000001;
		4'b0001: seg <= 7'b1001111;
		4'b0010: seg <= 7'b0010010;
		4'b0011: seg <= 7'b0000110;
		4'b0100: seg <= 7'b1001100;
		4'b0101: seg <= 7'b0100100;
		4'b0110: seg <= 7'b0100000;
		4'b0111: seg <= 7'b0001111;
		4'b1000: seg <= 7'b0000000;
		4'b1001: seg <= 7'b0000100;
		default: seg <= 7'bxxxxxxx;
	endcase
	
endmodule