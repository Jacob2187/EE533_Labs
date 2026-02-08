// Verilog Test Fixture Template

  `timescale 1 ns / 1 ns

  module TEST_gate_8bit;
          reg A0, A1 ,A2, A3, A4, A5, A6, A7, B0, B1, B2, B3, B4, B5, B6, B7, Cin;
          wire S0, S1, S2, S3, S4, S5, S6, S7, Cout;
			 
			 Eight_bit_Adder UUT (
				.A0(A0),
				.B0(B0),
				.Cin(Cin),
				.S0(S0),
				.Cout(Cout),
				.A1(A1),
				.B1(B1),
				.S1(S1),
				.A2(A2),
				.B2(B2),
				.S2(S2),
				.A3(A3),
				.B3(B3),
				.S3(S3),
				.A4(A4),
				.B4(B4),
				.S4(S4),
				.A5(A5),
				.B5(B5),
				.S5(S5),
				.A6(A6),
				.B6(B6),
				.S6(S6),
				.A7(A7),
				.B7(B7),
				.S7(S7)
	);

   // The following code initializes the Global Set Reset (GSR) and Global Three-State (GTS) nets
   // Refer to the Synthesis and Simulation Design Guide for more information on this process
   reg GSR;
   assign glbl.GSR = GSR;
   reg GTS;
   assign glbl.GTS = GTS;

   initial begin
      GSR = 1;
      GTS = 0; // GTS is not activated by default
      #100; // GSR is set for 100 ns
      GSR = 0;
   end

  // Initialize Inputs
      `ifdef auto_init
					A0 = 0;
					A1 = 0;
					A2 = 0;
					A3 = 0;
					A4 = 0;
					A5 = 0;
					A6 = 0;
					A7 = 0;
					B0 = 0;
					B1 = 0;
					B2 = 0;
					B3 = 0;
					B4 = 0;
					B5 = 0;
					B6 = 0;
					B7 = 0;
					Cin = 0;
      `endif
		
		initial begin
					A0 = 0;
					A1 = 0;
					A2 = 0;
					A3 = 0;
					A4 = 0;
					A5 = 0;
					A6 = 0;
					A7 = 0;
					B0 = 0;
					B1 = 0;
					B2 = 0;
					B3 = 0;
					B4 = 0;
					B5 = 0;
					B6 = 0;
					B7 = 0;
					Cin = 0;
					#10;
					A0 = 1;
					A1 = 1;
					A2 = 1;
					A3 = 1;
					A4 = 1;
					A5 = 1;
					A6 = 1;
					A7 = 1;
					B0 = 1;
					B1 = 1;
					B2 = 1;
					B3 = 1;
					B4 = 1;
					B5 = 1;
					B6 = 1;
					B7 = 1;
					Cin = 0;
					#10;
					A0 = 1;
					A1 = 1;
					A2 = 1;
					A3 = 1;
					A4 = 1;
					A5 = 1;
					A6 = 1;
					A7 = 1;
					B0 = 1;
					B1 = 1;
					B2 = 1;
					B3 = 1;
					B4 = 1;
					B5 = 1;
					B6 = 1;
					B7 = 1;
					Cin = 1;
					#10;
					A0 = 1;
					A1 = 1;
					A2 = 0;
					A3 = 0;
					A4 = 0;
					A5 = 0;
					A6 = 1;
					A7 = 0;
					B0 = 1;
					B1 = 0;
					B2 = 0;
					B3 = 0;
					B4 = 0;
					B5 = 0;
					B6 = 1;
					B7 = 0;
					Cin = 0;
					#10;
					A0 = 1;
					A1 = 0;
					A2 = 0;
					A3 = 1;
					A4 = 1;
					A5 = 1;
					A6 = 0;
					A7 = 0;
					B0 = 0;
					B1 = 0;
					B2 = 0;
					B3 = 0;
					B4 = 1;
					B5 = 1;
					B6 = 1;
					B7 = 1;
					Cin = 1;
					#10;
					A0 = 1;
					A1 = 0;
					A2 = 1;
					A3 = 0;
					A4 = 1;
					A5 = 0;
					A6 = 1;
					A7 = 0;
					B0 = 0;
					B1 = 1;
					B2 = 0;
					B3 = 1;
					B4 = 0;
					B5 = 1;
					B6 = 0;
					B7 = 1;
					Cin = 0;
					#10;
					A0 = 1;
					A1 = 1;
					A2 = 0;
					A3 = 0;
					A4 = 0;
					A5 = 0;
					A6 = 0;
					A7 = 0;
					B0 = 0;
					B1 = 0;
					B2 = 0;
					B3 = 0;
					B4 = 1;
					B5 = 1;
					B6 = 1;
					B7 = 0;
					Cin = 1;
					#10;
          end
  endmodule
