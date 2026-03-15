`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:33:20 03/02/2026 
// Design Name: 
// Module Name:    MAC_tb 
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
`timescale 1ns/1ps

module MAC_tb();

    // DUT I/O
    reg  [63:0] data0;
    reg  [63:0] data1;
    reg  [63:0] data2;
    wire [63:0] MAC_product;

    // instantiate the DUT
    BF16_MAC uut (
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .MAC_product(MAC_product)
    );

    // Helpful BF16 constants (16-bit encodings)
    localparam [15:0] BF16_1_0    = 16'h3F80; // +1.0
    localparam [15:0] BF16_1_5    = 16'h3FC0; // +1.5
    localparam [15:0] BF16_2_0    = 16'h4000; // +2.0
    localparam [15:0] BF16_2_25   = 16'h4010; // +2.25
    localparam [15:0] BF16_3_25   = 16'h4050; // +3.25
    localparam [15:0] BF16_NEG_1_5= 16'hBFC0; // -1.5

    // Helper function to pack four 16-bit lanes into a 64-bit word
    function [63:0] pack4;
        input [15:0] l3;
        input [15:0] l2;
        input [15:0] l1;
        input [15:0] l0;
        begin
            // lane0 -> bits [15:0], lane1 -> [31:16], lane2 -> [47:32], lane3 -> [63:48]
            pack4 = { l3, l2, l1, l0 };
        end
    endfunction

    initial begin
        // initialize to known non-zero exponents (avoid exp==0 case)
        data0 = 64'h0000_0000_0000_0000;
        data1 = 64'h0000_0000_0000_0000;
        data2 = 64'h0000_0000_0000_0000;

        // Wait a little before first vector
        #20;

        // -------------------------
        // Test vector 1
        // lanes (a,b,acc):
        //  lane0: 1.5 * 1.5 + 1.0 = 3.25  -> BF16 = 16'h4050
        //  lane1: 2.0 * 2.0 + 1.0 = 5.00  -> BF16 = 16'h40A0
        //  lane2: 1.0 * 1.0 + 1.0 = 2.00  -> BF16 = 16'h4000
        //  lane3: 1.5 * 1.5 + 1.5 = 3.75  -> BF16 = 16'h4070
        // expected MAC_product = { r3,   r2,   r1,   r0 } =
        //                      = {16'h4070,16'h4000,16'h40A0,16'h4050}
        // full 64-bit expected hex: 64'h4070_4000_40A0_4050
        data0 = pack4(BF16_1_5, BF16_2_0, BF16_1_0, BF16_1_5);  // a lanes: [l3,l2,l1,l0]
        data1 = pack4(BF16_1_5, BF16_2_0, BF16_1_0, BF16_1_5);  // b lanes
        data2 = pack4(BF16_1_0, BF16_1_0, BF16_1_0, BF16_1_5);  // acc lanes

        #100; // pause so you can inspect waveforms after vector 1

        // -------------------------
        // Test vector 2
        // lanes (a,b,acc):
        //  lane0: -1.5 * 1.5 + 1.0 = -1.25 -> BF16 = 16'hBFA0
        //  lane1:  1.5 * 2.0 + 1.0 =  4.00 -> BF16 = 16'h4080
        //  lane2:  2.0 * 1.5 + 1.0 =  4.00 -> BF16 = 16'h4080
        //  lane3:  1.0 * 2.25 + 1.5 =  3.75 -> BF16 = 16'h4070
        // expected MAC_product = {16'h4070,16'h4080,16'h4080,16'hBFA0}
        // full 64-bit expected hex: 64'h4070_4080_4080_BFA0
        data0 = pack4(BF16_NEG_1_5, BF16_1_5, BF16_2_0, BF16_1_0);
        data1 = pack4(BF16_1_5,      BF16_2_0, BF16_1_5, BF16_2_25);
        data2 = pack4(BF16_1_0,      BF16_1_0, BF16_1_0, BF16_1_5);

        #100; // pause to inspect vector 2

        // -------------------------
        // Test vector 3 (alignment cases)
        // lanes (a,b,acc):
        //  lane0: 2.0 * 1.5 + 1.5   = 4.5     -> BF16 = 16'h4090
        //  lane1: 1.5 * 2.25 + 1.0  = 4.375   -> BF16 = 16'h408C
        //  lane2: 2.25 * 2.25 + 1.0 = 6.0625  -> BF16 = 16'h40C2
        //  lane3: 1.5 * 1.0 + 2.0   = 3.5     -> BF16 = 16'h4060
        // expected MAC_product = {16'h4060,16'h40C2,16'h408C,16'h4090}
        // full 64-bit expected hex: 64'h4060_40C2_408C_4090
        data0 = pack4(BF16_2_0, BF16_1_5, BF16_2_25, BF16_1_5);
        data1 = pack4(BF16_1_5, BF16_2_25, BF16_2_25, BF16_1_0);
        data2 = pack4(BF16_1_5, BF16_1_0, BF16_1_0, BF16_2_0);

        #100;

        // -------------------------
        // Test vector 4 (repeat vector 1 for transition check)
        // expected same as Test vector 1:
        // expected MAC_product = 64'h4070_4000_40A0_4050
        data0 = pack4(BF16_1_5, BF16_2_0, BF16_1_0, BF16_1_5);
        data1 = pack4(BF16_1_5, BF16_2_0, BF16_1_0, BF16_1_5);
        data2 = pack4(BF16_1_0, BF16_1_0, BF16_1_0, BF16_1_5);

        #100;

        // End simulation (user will inspect waveform in ISE)
        $stop;
    end

endmodule
