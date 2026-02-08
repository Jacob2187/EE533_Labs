// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module TEST_32bit_ALU;

    reg  A0,  A1,  A2,  A3,  A4,  A5,  A6,  A7,
         A8,  A9,  A10, A11, A12, A13, A14, A15,
         A16, A17, A18, A19, A20, A21, A22, A23,
         A24, A25, A26, A27, A28, A29, A30, A31;

    reg  B0,  B1,  B2,  B3,  B4,  B5,  B6,  B7,
         B8,  B9,  B10, B11, B12, B13, B14, B15,
         B16, B17, B18, B19, B20, B21, B22, B23,
         B24, B25, B26, B27, B28, B29, B30, B31;

    reg Opr1, Opr0, EN;

    wire S0,  S1,  S2,  S3,  S4,  S5,  S6,  S7,
         S8,  S9,  S10, S11, S12, S13, S14, S15,
         S16, S17, S18, S19, S20, S21, S22, S23,
         S24, S25, S26, S27, S28, S29, S30, S31;

    wire Cout, Equality;

    ALU_32 UUT (
        .A0(A0),   .B0(B0),   .S0(S0),
        .A1(A1),   .B1(B1),   .S1(S1),
        .A2(A2),   .B2(B2),   .S2(S2),
        .A3(A3),   .B3(B3),   .S3(S3),
        .A4(A4),   .B4(B4),   .S4(S4),
        .A5(A5),   .B5(B5),   .S5(S5),
        .A6(A6),   .B6(B6),   .S6(S6),
        .A7(A7),   .B7(B7),   .S7(S7),
        .A8(A8),   .B8(B8),   .S8(S8),
        .A9(A9),   .B9(B9),   .S9(S9),
        .A10(A10), .B10(B10), .S10(S10),
        .A11(A11), .B11(B11), .S11(S11),
        .A12(A12), .B12(B12), .S12(S12),
        .A13(A13), .B13(B13), .S13(S13),
        .A14(A14), .B14(B14), .S14(S14),
        .A15(A15), .B15(B15), .S15(S15),
        .A16(A16), .B16(B16), .S16(S16),
        .A17(A17), .B17(B17), .S17(S17),
        .A18(A18), .B18(B18), .S18(S18),
        .A19(A19), .B19(B19), .S19(S19),
        .A20(A20), .B20(B20), .S20(S20),
        .A21(A21), .B21(B21), .S21(S21),
        .A22(A22), .B22(B22), .S22(S22),
        .A23(A23), .B23(B23), .S23(S23),
        .A24(A24), .B24(B24), .S24(S24),
        .A25(A25), .B25(B25), .S25(S25),
        .A26(A26), .B26(B26), .S26(S26),
        .A27(A27), .B27(B27), .S27(S27),
        .A28(A28), .B28(B28), .S28(S28),
        .A29(A29), .B29(B29), .S29(S29),
        .A30(A30), .B30(B30), .S30(S30),
        .A31(A31), .B31(B31), .S31(S31),
        .Cout(Cout),
		  .EN(EN),
		  .Opr1(Opr1),
		  .Opr0(Opr0),
		  .Equality(Equality)
    );

    // Global Set/Reset and Global Tri-State
    reg GSR;
    assign glbl.GSR = GSR;
    reg GTS;
    assign glbl.GTS = GTS;

    initial begin
        GSR = 1;
        GTS = 0;
        #100;
        GSR = 0;
    end
	 		`ifdef auto_init
					{A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
         A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'b0;

        {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
         B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'b0;


      `endif


// Test Vectors
initial begin

    // Default control
    EN   = 1'b1;
    Opr1 = 1'b0;
    Opr0 = 1'b0;

    // -------- Test Case 1: ADD (0 + 0) --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'h00000000;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'h00000000;

    Opr1 = 0; Opr0 = 0;   // ADD
    #10;

    // -------- Test Case 2: ADD (mixed operands) --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'h12345678;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'h11111111;

    Opr1 = 0; Opr0 = 0;   // ADD
    #10;

    // -------- Test Case 3: SHIFT LEFT by 1 --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'h40000001;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'h00000000;

    Opr1 = 0; Opr0 = 1;   // SHL
    #10;

    // -------- Test Case 4: SUB (A - B, no borrow) --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'h00000020;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'h00000010;

    Opr1 = 1; Opr0 = 0;   // SUB
    #10;

    // -------- Test Case 5: SUB (A - B, borrow case) --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'h00000010;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'h00000020;

    Opr1 = 1; Opr0 = 0;   // SUB
    #10;

    // -------- Test Case 6: COMPARE (Equality = 1) --------
    {A31,A30,A29,A28,A27,A26,A25,A24,A23,A22,A21,A20,A19,A18,A17,A16,
     A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0} = 32'hDEADBEEF;

    {B31,B30,B29,B28,B27,B26,B25,B24,B23,B22,B21,B20,B19,B18,B17,B16,
     B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0} = 32'hDEADBEEF;

    Opr1 = 1; Opr0 = 1;   // COMPARE
    #10;

end

endmodule
