// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module TEST_32bit_ALU_Verilog;

    reg  [31:0] A, B;

    reg EN;
	 
	 reg [1:0] Opr;

    wire [31:0] S;

    wire Cout, Equality;

    ALU_32_Verilog UUT (
        .A(A),   .B(B),   .S(S),
		  .EN(EN),
		  .Opr(Opr),
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
	 	

// Test Vectors
initial begin

    // Default control
    EN  = 1'b1;
    Opr = 2'b00;

    // -------- Test Case 1: ADD (0 + 0) --------
    A = 32'h00000000;

    B = 32'h00000000;

    Opr = 2'b0;   // ADD
    #10;

    // -------- Test Case 2: ADD (mixed operands) --------
    A = 32'h12345678;

    B = 32'h11111111;

    Opr = 2'b00;   // ADD
    #10;

    // -------- Test Case 3: SHIFT LEFT by 1 --------
    A = 32'h40000001;

    B = 32'h00000000;

    Opr = 2'b01;   // SHL
    #10;

    // -------- Test Case 4: SUB (A - B, no borrow) --------
    A = 32'h00000020;

    B = 32'h00000010;

    Opr = 2'b10;   // SUB
    #10;

    // -------- Test Case 5: SUB (A - B, borrow case) --------
    A = 32'h00000010;

    B = 32'h00000020;

    Opr = 2'b10;   // SUB
    #10;

    // -------- Test Case 6: COMPARE (Equality = 1) --------
    A = 32'hDEADBEEF;

    B = 32'hDEADBEEF;

    Opr = 2'b11;   // COMPARE
    #10;

end

endmodule
