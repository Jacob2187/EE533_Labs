module ReLU(
    input [63:0] A,
    output [63:0] C
);

    assign C[15:0] = (A[15])? 16'd0:A[15:0];
    assign C[31:16] = (A[31])? 16'd0:A[31:16];
    assign C[47:32] = (A[47])? 16'd0:A[47:32];
    assign C[63:48] = (A[63])? 16'd0:A[63:48];

endmodule