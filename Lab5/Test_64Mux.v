`timescale 1ns / 1ps

module tb_Mux_16to4_64bit_minimal;

    reg  [63:0] in0;
    reg  [63:0] in1;
    reg  [63:0] in2;
    reg  [63:0] in3;
    reg  [63:0] in4;
    reg  [63:0] in5;
    reg  [63:0] in6;
    reg  [63:0] in7;
    reg  [63:0] in8;
    reg  [63:0] in9;
    reg  [63:0] in10;
    reg  [63:0] in11;
    reg  [63:0] in12;
    reg  [63:0] in13;
    reg  [63:0] in14;
    reg  [63:0] in15;
    reg  [3:0]  sel;
    wire [63:0] out;

    // DUT instantiation
    Mux_16to4_64bit dut (
        .in0(in0), .in1(in1), .in2(in2), .in3(in3),
        .in4(in4), .in5(in5), .in6(in6), .in7(in7),
        .in8(in8), .in9(in9), .in10(in10), .in11(in11),
        .in12(in12), .in13(in13), .in14(in14), .in15(in15),
        .sel(sel), .out(out)
    );

    initial begin
        // initialize patterns: repeating bytes = index
        in0  = 64'h0000000000000000; // 0x00..
        in1  = 64'h0101010101010101; // 0x01..
        in2  = 64'h0202020202020202;
        in3  = 64'h0303030303030303;
        in4  = 64'h0404040404040404;
        in5  = 64'h0505050505050505;
        in6  = 64'h0606060606060606;
        in7  = 64'h0707070707070707;
        in8  = 64'h0808080808080808;
        in9  = 64'h0909090909090909;
        in10 = 64'h0A0A0A0A0A0A0A0A;
        in11 = 64'h0B0B0B0B0B0B0B0B;
        in12 = 64'h0C0C0C0C0C0C0C0C;
        in13 = 64'h0D0D0D0D0D0D0D0D;
        in14 = 64'h0E0E0E0E0E0E0E0E;
        in15 = 64'h0F0F0F0F0F0F0F0F;

        // small delay before starting
        sel = 4'd0;
        #10;

        // step through selectors 0..15 (each vector stays 10 ns)
        sel = 4'd0; #10;
        sel = 4'd1; #10;
        sel = 4'd2; #10;
        sel = 4'd3; #10;
        sel = 4'd4; #10;
        sel = 4'd5; #10;
        sel = 4'd6; #10;
        sel = 4'd7; #10;
        sel = 4'd8; #10;
        sel = 4'd9; #10;
        sel = 4'd10; #10;
        sel = 4'd11; #10;
        sel = 4'd12; #10;
        sel = 4'd13; #10;
        sel = 4'd14; #10;
        sel = 4'd15; #10;

        // extra edge-case inputs (overwrite some inputs)
        in0  = 64'h0000000000000000; // all zeros
        in5  = 64'hFFFFFFFFFFFFFFFF; // all ones
        in7  = 64'h00000000FFFFFFFF; // lower half ones
        in10 = 64'h0123456789ABCDEF; // arbitrary pattern

        // check the updated selections (each #10 so you can inspect)
        sel = 4'd0;  #10;
        sel = 4'd5;  #10;
        sel = 4'd7;  #10;
        sel = 4'd10; #10;

        // leave waveform open
        $stop;
    end

endmodule
