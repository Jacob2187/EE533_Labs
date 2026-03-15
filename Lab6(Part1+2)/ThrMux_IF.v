`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:35 02/23/2026 
// Design Name: 
// Module Name:    ThrMux_IF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ThrMux_IF(
		input [63:0] Thread00,
		input [63:0] Thread01,
		input [63:0] Thread10,
		input [63:0] Thread11,
		input [1:0] thread,
		output [63:0] PC_Dummy
    );

		assign PC_Dummy = (thread == 2'b00) ? Thread00 :
								(thread == 2'b01) ? Thread01 :
								(thread == 2'b10) ? Thread10 :
								(thread == 2'b11) ? Thread11 :
								0;

endmodule
