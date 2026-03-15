`timescale 1ns / 1ps

module PC_MUX_00
(
    input [63:0] PC_next_in,
    input [63:0] BTA,
    input PC_ctrl,
	 input [1:0] thread,

    output [63:0] PC_next_out
);

    assign PC_next_out = (PC_ctrl == 1 && thread == 2'b00)? BTA : PC_next_in;

endmodule