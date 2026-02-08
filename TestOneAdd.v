// Verilog Test Fixture Template

  `timescale 1 ns / 1 ps

  module TEST_gate_1bit;
          reg A;
			 reg B;
			 reg C;
          
          wire S;
          wire CO;


	one_bit_Adder UUT (
		.A(A),
		.B(B),
		.C(C),
		.S(S),
		.CO(CO)
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
				A = 0;
				B = 0;
				C = 0;
				
		`endif
		 
          initial begin
				A = 0;
				B = 0;
				C = 0;
				#10;
				A = 0;
				B = 0;
				C = 1;
				#10;
				A = 0;
				B = 1;
				C = 0;
				#10;
				A = 0;
				B = 1;
				C = 1;
				#10;
				A = 1;
				B = 0;
				C = 0;
				#10;
				A = 1;
				B = 0;
				C = 1;
				#10;
				A = 1;
				B = 1;
				C = 0;
				#10;
				A = 1;
				B = 1;
				C = 1;
				#10;
          end
			 
  endmodule
