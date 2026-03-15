`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:17 02/11/2026 
// Design Name: 
// Module Name:    Mux_16to4_64bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0           .01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux_16to4_64bit(
		input [63:0] in0,
        input [63:0] in1,
        input [63:0] in2,
        input [63:0] in3,
        input [63:0] in4,
        input [63:0] in5,
        input [63:0] in6,
        input [63:0] in7,
        input [63:0] in8,
        input [63:0] in9,
        input [63:0] in10,
        input [63:0] in11,
        input [63:0] in12,
        input [63:0] in13,
        input [63:0] in14,
        input [63:0] in15,
        input [3:0] sel,
        output [63:0] out
    );

    genvar i;
    generate
        for (i=0;i<64;i=i+1) begin: bits
            M16_1E m (
                .D0(in0[i]),
                .D1(in1[i]),
                .D2(in2[i]),
                .D3(in3[i]),
                .D4(in4[i]),
                .D5(in5[i]),
                .D6(in6[i]),
                .D7(in7[i]),
                .D8(in8[i]),
                .D9(in9[i]),
                .D10(in10[i]),
                .D11(in11[i]),
                .D12(in12[i]),
                .D13(in13[i]),
                .D14(in14[i]),
                .D15(in15[i]),
                .S0(sel[0]),
                .S1(sel[1]),
                .S2(sel[2]),
                .S3(sel[3]),
                .E(1),
                .O(out[i])
            );
        end
    endgenerate


endmodule