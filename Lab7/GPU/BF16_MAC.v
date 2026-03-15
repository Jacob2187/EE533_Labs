`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:49 03/02/2026 
// Design Name: 
// Module Name:    BF16_MAC 
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

// Warning!! Not able to handle when Exponent(14th to 7th bit in every 16 bit data) is 0!

module BF16_MAC(
    input [63:0] data0,
    input [63:0] data1,
    input [63:0] data2,
    output [63:0] MAC_product 
);
// Parsing data0 into 4 BFloat16 data with each of them containing 1 sign bit, 8 exponent bits and 7 mantissa bits

    wire [15:0] d00;
    assign d00 = data0[15:0];
    wire [7:0] ex00;
    assign ex00 = d00[14:7];
    wire [7:0] man00;
    assign man00 = {1'b1, d00[6:0]};
    wire s00;
    assign s00 = d00[15];

    wire [15:0] d01;
    assign d01 = data0[31:16];
    wire [7:0] ex01;
    assign ex01 = d01[14:7];
    wire [7:0] man01;
    assign man01 = {1'b1, d01[6:0]};
    wire s01;
    assign s01 = d01[15];

    wire [15:0] d02;
    assign d02 = data0[47:32];
    wire [7:0] ex02;
    assign ex02 = d02[14:7];
    wire [7:0] man02;
    assign man02 = {1'b1, d02[6:0]};
    wire s02;
    assign s02 = d02[15];

    wire [15:0] d03;
    assign d03 = data0[63:48];
    wire [7:0] ex03;
    assign ex03 = d03[14:7];
    wire [7:0] man03;
    assign man03 = {1'b1, d03[6:0]};
    wire s03;
    assign s03 = d03[15];

// Parsing data1

    wire [15:0] d10;
    assign d10 = data1[15:0];
    wire [7:0] ex10;
    assign ex10 = d10[14:7];
    wire [7:0] man10;
    assign man10 = {1'b1, d10[6:0]};
    wire s10;
    assign s10 = d10[15];

    wire [15:0] d11;
    assign d11 = data1[31:16];
    wire [7:0] ex11;
    assign ex11 = d11[14:7];
    wire [7:0] man11;
    assign man11 = {1'b1, d11[6:0]};
    wire s11;
    assign s11 = d11[15];

    wire [15:0] d12;
    assign d12 = data1[47:32];
    wire [7:0] ex12;
    assign ex12 = d12[14:7];
    wire [7:0] man12;
    assign man12 = {1'b1, d12[6:0]};
    wire s12;
    assign s12 = d12[15];

    wire [15:0] d13;
    assign d13 = data1[63:48];
    wire [7:0] ex13;
    assign ex13 = d13[14:7];
    wire [7:0] man13;
    assign man13 = {1'b1, d13[6:0]};
    wire s13;
    assign s13 = d13[15];

// Parsing data2

    wire [15:0] d20;
    assign d20 = data2[15:0];
    wire [7:0] ex20;
    assign ex20 = d20[14:7];
    wire [7:0] man20;
    assign man20 = {1'b1, d20[6:0]};
    wire s20;
    assign s20 = d20[15];

    wire [15:0] d21;
    assign d21 = data2[31:16];
    wire [7:0] ex21;
    assign ex21 = d21[14:7];
    wire [7:0] man21;
    assign man21 = {1'b1, d21[6:0]};
    wire s21;
    assign s21 = d21[15];

    wire [15:0] d22;
    assign d22 = data2[47:32];
    wire [7:0] ex22;
    assign ex22 = d22[14:7];
    wire [7:0] man22;
    assign man22 = {1'b1, d22[6:0]};
    wire s22;
    assign s22 = d22[15];

    wire [15:0] d23;
    assign d23 = data2[63:48];
    wire [7:0] ex23;
    assign ex23 = d23[14:7];
    wire [7:0] man23;
    assign man23 = {1'b1, d23[6:0]};
    wire s23;
    assign s23 = d23[15];

// Multiplication

    wire [15:0] prod0;
    wire psign0;
    wire [7:0] pex0;
    wire [6:0] pman0;
    wire [15:0] mult0;
    assign mult0 = man00 * man10;
    wire norm0 = mult0[15];
    assign psign0 = s00 ^ s10;
    wire [7:0] pex_sum0 = ex00 + ex10 - 8'd127;
    wire [15:0] mult0_norm = (norm0) ? (mult0 >> 1) : mult0;
    assign pman0 = mult0_norm[13:7];
    assign pex0 = (norm0) ? (pex_sum0 + 1'b1) : pex_sum0;
    assign prod0 = {psign0, pex0, pman0};

    wire [15:0] prod1;
    wire psign1;
    wire [7:0] pex1;
    wire [6:0] pman1;
    wire [15:0] mult1;
    assign mult1 = man01 * man11;
    wire norm1 = mult1[15];
    assign psign1 = s01 ^ s11;
    wire [7:0] pex_sum1 = ex01 + ex11 - 8'd127;
    wire [15:0] mult1_norm = (norm1) ? (mult1 >> 1) : mult1;
    assign pman1 = mult1_norm[13:7];
    assign pex1 = (norm1) ? (pex_sum1 + 1'b1) : pex_sum1;
    assign prod1 = {psign1, pex1, pman1};

    wire [15:0] prod2;
    wire psign2;
    wire [7:0] pex2;
    wire [6:0] pman2;
    wire [15:0] mult2;
    assign mult2 = man02 * man12;
    wire norm2 = mult2[15];
    assign psign2 = s02 ^ s12;
    wire [7:0] pex_sum2 = ex02 + ex12 - 8'd127;
    wire [15:0] mult2_norm = (norm2) ? (mult2 >> 1) : mult2;
    assign pman2 = mult2_norm[13:7];
    assign pex2 = (norm2) ? (pex_sum2 + 1'b1) : pex_sum2;
    assign prod2 = {psign2, pex2, pman2};

    wire [15:0] prod3;
    wire psign3;
    wire [7:0] pex3;
    wire [6:0] pman3;
    wire [15:0] mult3;
    assign mult3 = man03 * man13;
    wire norm3 = mult3[15];
    assign psign3 = s03 ^ s13;
    wire [7:0] pex_sum3 = ex03 + ex13 - 8'd127;
    wire [15:0] mult3_norm = (norm3) ? (mult3 >> 1) : mult3;
    assign pman3 = mult3_norm[13:7];
    assign pex3 = (norm3) ? (pex_sum3 + 1'b1) : pex_sum3;
    assign prod3 = {psign3, pex3, pman3};

//Accumulate

// Parsing product from multiplication

    wire p0s = prod0[15]; wire [7:0] p0e = prod0[14:7]; wire [6:0] p0m = prod0[6:0];
    wire p1s = prod1[15]; wire [7:0] p1e = prod1[14:7]; wire [6:0] p1m = prod1[6:0];
    wire p2s = prod2[15]; wire [7:0] p2e = prod2[14:7]; wire [6:0] p2m = prod2[6:0];
    wire p3s = prod3[15]; wire [7:0] p3e = prod3[14:7]; wire [6:0] p3m = prod3[6:0];

// Parsing data2 from input

    wire c0s = data2[15]; wire [7:0] c0e = data2[14:7]; wire [6:0] c0m = data2[6:0];
    wire c1s = data2[31]; wire [7:0] c1e = data2[30:23]; wire [6:0] c1m = data2[22:16];
    wire c2s = data2[47]; wire [7:0] c2e = data2[46:39]; wire [6:0] c2m = data2[38:32];
    wire c3s = data2[63]; wire [7:0] c3e = data2[62:55]; wire [6:0] c3m = data2[54:48];

// Decide and assign which is bigger or smaller

    wire [7:0] e_diff0 = (p0e>c0e)? (p0e - c0e):(c0e - p0e);
    wire [7:0] e_diff1 = (p1e>c1e)? (p1e - c1e):(c1e - p1e);
    wire [7:0] e_diff2 = (p2e>c2e)? (p2e - c2e):(c2e - p2e);
    wire [7:0] e_diff3 = (p3e>c3e)? (p3e - c3e):(c3e - p3e);

    wire big_s0; wire big_s1; wire big_s2; wire big_s3;
    wire small_s0; wire small_s1; wire small_s2; wire small_s3;

    wire [7:0] big_e0; wire [7:0] big_e1; wire [7:0] big_e2; wire [7:0] big_e3;

    wire [6:0] small_m0; wire [6:0] small_m1; wire [6:0] small_m2; wire [6:0] small_m3;
    wire [6:0] big_m0; wire [6:0] big_m1; wire [6:0] big_m2; wire [6:0] big_m3;
	 

    assign small_m0 = (p0e>c0e)? (c0m):(p0m);
	 wire [7:0] small_m0_one = {1'b1, small_m0};
	 wire [7:0] small_m0_extend = small_m0_one >> e_diff0;
    assign big_e0 = (p0e>c0e)? p0e:c0e;
    assign big_m0 = (p0e>c0e)? p0m:c0m;
    assign big_s0 = (p0e>c0e)? p0s:c0s;
    assign small_s0 = (p0e>c0e)? c0s:p0s;
    wire [6:0] equal_m0p = (p0e==c0e)? p0m:0;
    wire [6:0] equal_m0c = (p0e==c0e)? c0m:0;
    wire equal_s0p = (p0e==c0e)? p0s:0;
    wire equal_s0c = (p0e==c0e)? c0s:0;

    assign small_m1 = (p1e>c1e)? (c1m):(p1m);
	 wire [7:0] small_m1_one = {1'b1, small_m1};
	 wire [7:0] small_m1_extend = small_m1_one >> e_diff1;
    assign big_e1 = (p1e>=c1e)? p1e:c1e;
    assign big_m1 = (p1e>=c1e)? p1m:c1m;
    assign big_s1 = (p1e>=c1e)? p1s:c1s;
    assign small_s1 = (p1e>=c1e)? c1s:p1s;
    wire [6:0] equal_m1p = (p1e==c1e)? p1m:0;
    wire [6:0] equal_m1c = (p1e==c1e)? c1m:0;
    wire equal_s1p = (p1e==c1e)? p1s:0;
    wire equal_s1c = (p1e==c1e)? c1s:0;

    assign small_m2 = (p2e>c2e)? (c2m):(p2m);
	 wire [7:0] small_m2_one = {1'b1, small_m2};
	 wire [7:0] small_m2_extend = small_m2_one >> e_diff2;
    assign big_e2 = (p2e>=c2e)? p2e:c2e;
    assign big_m2 = (p2e>=c2e)? p2m:c2m;
    assign big_s2 = (p2e>=c2e)? p2s:c2s;
    assign small_s2 = (p2e>=c2e)? c2s:p2s;
    wire [6:0] equal_m2p = (p2e==c2e)? p2m:0;
    wire [6:0] equal_m2c = (p2e==c2e)? c2m:0;
    wire equal_s2p = (p2e==c2e)? p2s:0;
    wire equal_s2c = (p2e==c2e)? c2s:0;

    assign small_m3 = (p3e>c3e)? (c3m):(p3m);
	 wire [7:0] small_m3_one = {1'b1, small_m3};
	 wire [7:0] small_m3_extend = small_m3_one >> e_diff3;
    assign big_e3 = (p3e>=c3e)? p3e:c3e;
    assign big_m3 = (p3e>=c3e)? p3m:c3m;
    assign big_s3 = (p3e>=c3e)? p3s:c3s;
    assign small_s3 = (p3e>=c3e)? c3s:p3s;
    wire [6:0] equal_m3p = (p3e==c3e)? p3m:0;
    wire [6:0] equal_m3c = (p3e==c3e)? c3m:0;
    wire equal_s3p = (p3e==c3e)? p3s:0;
    wire equal_s3c = (p3e==c3e)? c3s:0;

// Wires for final assignment

    wire [15:0] mac_prod0; wire [15:0] mac_prod1; wire [15:0] mac_prod2; wire [15:0] mac_prod3;

    wire [7:0] mac_ex0; wire [7:0] mac_ex1; wire [7:0] mac_ex2; wire [7:0] mac_ex3;

    wire [6:0] mac_man0; wire [6:0] mac_man1; wire [6:0] mac_man2; wire [6:0] mac_man3;

    wire mac_s0; wire mac_s1; wire mac_s2; wire mac_s3;

//Accumulation (Exponent not equal)

    function [2:0] Left_shift_value;
        input [8:0] shiftee;
        begin
				if (shiftee[7]) Left_shift_value = 3'd0;
            else if(shiftee[6]) Left_shift_value = 3'd1;
            else if(shiftee[5]) Left_shift_value = 3'd2;
            else if(shiftee[4]) Left_shift_value = 3'd3;
            else if(shiftee[3]) Left_shift_value = 3'd4;
            else if(shiftee[2]) Left_shift_value = 3'd5;
            else if(shiftee[1]) Left_shift_value = 3'd6;
            else if(shiftee[0]) Left_shift_value = 3'd7;
            else Left_shift_value = 3'd0;
        end
    endfunction

    function [0:0] Right_shift;
        input [8:0] Add_shiftee;
        begin
            if(Add_shiftee[8]) Right_shift = 1;
            else Right_shift = 0;
        end
    endfunction

// Data0

    wire [7:0] mac1_ex0 = big_e0;
    wire [7:0] big_m0_extend = {1'b1, big_m0};
    wire [8:0] mac1_man0;
    assign mac1_man0 = (big_s0 ^ small_s0) ? (big_m0_extend - small_m0_extend):(big_m0_extend + small_m0_extend);

    wire mac_norm0_add = Right_shift(mac1_man0);
    wire [2:0] mac_norm0_sub = Left_shift_value(mac1_man0);

    wire [8:0] mac2_man0;
    assign mac2_man0 = (big_s0 ^ small_s0) ? (mac1_man0 << mac_norm0_sub):(mac1_man0 >> mac_norm0_add);
    wire [7:0] mac2_ex0 = (big_s0 ^ small_s0) ? (mac1_ex0 - mac_norm0_sub):(mac1_ex0 + mac_norm0_add);
    wire mac1_s0 = big_s0;

// Data1

    wire [7:0] mac1_ex1 = big_e1;
    wire [7:0] big_m1_extend = {1'b1, big_m1};
    wire [8:0] mac1_man1;
    assign mac1_man1 = (big_s1 ^ small_s1) ? (big_m1_extend - small_m1_extend):(big_m1_extend + small_m1_extend);

    wire mac_norm1_add = Right_shift(mac1_man1);
    wire [2:0] mac_norm1_sub = Left_shift_value(mac1_man1);

    wire [8:0] mac2_man1;
    assign mac2_man1 = (big_s1 ^ small_s1) ? (mac1_man1 << mac_norm1_sub):(mac1_man1 >> mac_norm1_add);
    wire [7:0] mac2_ex1 = (big_s1 ^ small_s1) ? (mac1_ex1 - mac_norm1_sub):(mac1_ex1 + mac_norm1_add);
    wire mac1_s1 = big_s1;

// Data2

    wire [7:0] mac1_ex2 = big_e2;
    wire [7:0] big_m2_extend = {1'b1, big_m2};
    wire [8:0] mac1_man2;
    assign mac1_man2 = (big_s2 ^ small_s2) ? (big_m2_extend - small_m2_extend):(big_m2_extend + small_m2_extend);

    wire mac_norm2_add = Right_shift(mac1_man2);
    wire [2:0] mac_norm2_sub = Left_shift_value(mac1_man2);

    wire [8:0] mac2_man2;
    assign mac2_man2 = (big_s2 ^ small_s2) ? (mac1_man2 << mac_norm2_sub):(mac1_man2 >> mac_norm2_add);
    wire [7:0] mac2_ex2 = (big_s2 ^ small_s2) ? (mac1_ex2 - mac_norm2_sub):(mac1_ex2 + mac_norm2_add);
    wire mac1_s2 = big_s2;

// Data2

    wire [7:0] mac1_ex3 = big_e3;
    wire [7:0] big_m3_extend = {1'b1, big_m3};
    wire [8:0] mac1_man3;
    assign mac1_man3 = (big_s3 ^ small_s3) ? (big_m3_extend - small_m3_extend):(big_m3_extend + small_m3_extend);

    wire mac_norm3_add = Right_shift(mac1_man3);
    wire [2:0] mac_norm3_sub = Left_shift_value(mac1_man3);

    wire [8:0] mac2_man3;
    assign mac2_man3 = (big_s3 ^ small_s3) ? (mac1_man3 << mac_norm3_sub):(mac1_man3 >> mac_norm3_add);
    wire [7:0] mac2_ex3 = (big_s3 ^ small_s3) ? (mac1_ex3 - mac_norm3_sub):(mac1_ex3 + mac_norm3_add);
    wire mac1_s3 = big_s3;

//Accumulation (Exponent equal)

//Data0

    wire [8:0] mac_man0_equal;
    wire [7:0] equal_m0p_extend = {1'b1, equal_m0p};
    wire [7:0] equal_m0c_extend = {1'b1, equal_m0c};
    assign mac_man0_equal = (equal_s0p ^ equal_s0c) ? (equal_m0p - equal_m0c):(equal_m0p_extend + equal_m0c_extend);
    wire mac_norm0_add_equal = Right_shift(mac_man0_equal);
    wire [2:0] mac_norm0_sub_equal = Left_shift_value(mac_man0_equal);
    wire [7:0] mac_ex0_equal = (equal_s0p ^ equal_s0c) ? (p0e - mac_norm0_sub_equal):(p0e + mac_norm0_add_equal);
    wire [8:0] mac1_man0_equal;
    assign mac1_man0_equal = (equal_s0p ^ equal_s0c) ? (mac_man0_equal << mac_norm0_sub_equal):(mac_man0_equal >> mac_norm0_add_equal);
    wire mac_s0_equal;
    assign mac_s0_equal = (p0m >= c0m) ? (equal_s0p):(equal_s0c);

//Data1

    wire [8:0] mac_man1_equal;
    wire [7:0] equal_m1p_extend = {1'b1, equal_m1p};
    wire [7:0] equal_m1c_extend = {1'b1, equal_m1c};
    assign mac_man1_equal = (equal_s1p ^ equal_s1c) ? (equal_m1p - equal_m1c):(equal_m1p_extend + equal_m1c_extend);
    wire mac_norm1_add_equal = Right_shift(mac_man1_equal);
    wire [2:0] mac_norm1_sub_equal = Left_shift_value(mac_man1_equal);
    wire [7:0] mac_ex1_equal = (equal_s1p ^ equal_s1c) ? (p1e - mac_norm1_sub_equal):(p1e + mac_norm1_add_equal);
    wire [8:0] mac1_man1_equal;
    assign mac1_man1_equal = (equal_s1p ^ equal_s1c) ? (mac_man1_equal << mac_norm1_sub_equal):(mac_man1_equal >> mac_norm1_add_equal);
    wire mac_s1_equal;
    assign mac_s1_equal = (p1m >= c1m) ? (equal_s1p):(equal_s1c);

//Data2

    wire [8:0] mac_man2_equal;
    wire [7:0] equal_m2p_extend = {1'b1, equal_m2p};
    wire [7:0] equal_m2c_extend = {1'b1, equal_m2c};
    assign mac_man2_equal = (equal_s2p ^ equal_s2c) ? (equal_m2p - equal_m2c):(equal_m2p_extend + equal_m2c_extend);
    wire mac_norm2_add_equal = Right_shift(mac_man2_equal);
    wire [2:0] mac_norm2_sub_equal = Left_shift_value(mac_man2_equal);
    wire [7:0] mac_ex2_equal = (equal_s2p ^ equal_s2c) ? (p2e - mac_norm2_sub_equal):(p2e + mac_norm2_add_equal);
    wire [8:0] mac1_man2_equal;
    assign mac1_man2_equal = (equal_s2p ^ equal_s2c) ? (mac_man2_equal << mac_norm2_sub_equal):(mac_man2_equal >> mac_norm2_add_equal);
    wire mac_s2_equal;
    assign mac_s2_equal = (p0m >= c0m) ? (equal_s2p):(equal_s2c);

//Data2

    wire [8:0] mac_man3_equal;
    wire [7:0] equal_m3p_extend = {1'b1, equal_m3p};
    wire [7:0] equal_m3c_extend = {1'b1, equal_m3c};
    assign mac_man3_equal = (equal_s3p ^ equal_s3c) ? (equal_m3p - equal_m3c):(equal_m3p_extend + equal_m3c_extend);
    wire mac_norm3_add_equal = Right_shift(mac_man3_equal);
    wire [2:0] mac_norm3_sub_equal = Left_shift_value(mac_man3_equal);
    wire [7:0] mac_ex3_equal = (equal_s3p ^ equal_s3c) ? (p3e - mac_norm3_sub_equal):(p3e + mac_norm3_add_equal);
    wire [8:0] mac1_man3_equal;
    assign mac1_man3_equal = (equal_s3p ^ equal_s3c) ? (mac_man3_equal << mac_norm3_sub_equal):(mac_man3_equal >> mac_norm3_add_equal);
    wire mac_s3_equal;
    assign mac_s3_equal = (p3m >= c3m) ? (equal_s3p):(equal_s3c);

//Final assignment

//Data0

    assign mac_man0 = (p0e==c0e) ? (mac1_man0_equal[6:0]):(mac2_man0[6:0]);
    assign mac_ex0 = (p0e==c0e) ? (mac_ex0_equal):(mac2_ex0);
    assign mac_s0 = (p0e==c0e) ? (mac_s0_equal):(mac1_s0);

//Data1

    assign mac_man1 = (p1e==c1e) ? (mac1_man1_equal[6:0]):(mac2_man1[6:0]);
    assign mac_ex1 = (p1e==c1e) ? (mac_ex1_equal):(mac2_ex1);
    assign mac_s1 = (p1e==c1e) ? (mac_s1_equal):(mac1_s1);

//Data2

    assign mac_man2 = (p2e==c2e) ? (mac1_man2_equal[6:0]):(mac2_man2[6:0]);
    assign mac_ex2 = (p2e==c2e) ? (mac_ex2_equal):(mac2_ex2);
    assign mac_s2 = (p2e==c2e) ? (mac_s2_equal):(mac1_s2);

//Data2

    assign mac_man3 = (p3e==c3e) ? (mac1_man3_equal[6:0]):(mac2_man3[6:0]);
    assign mac_ex3 = (p3e==c3e) ? (mac_ex3_equal):(mac2_ex3);
    assign mac_s3 = (p3e==c3e) ? (mac_s3_equal):(mac1_s3);
    
//Final assign

    assign mac_prod0 = {mac_s0, mac_ex0, mac_man0};
    assign mac_prod1 = {mac_s1, mac_ex1, mac_man1};
    assign mac_prod2 = {mac_s2, mac_ex2, mac_man2};
    assign mac_prod3 = {mac_s3, mac_ex3, mac_man3};

    assign MAC_product = {mac_prod3, mac_prod2, mac_prod1, mac_prod0};


endmodule
