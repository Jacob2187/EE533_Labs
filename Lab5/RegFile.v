`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:42 02/11/2026 
// Design Name: 
// Module Name:    RegFile 
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

//This is designed exactly like Lab 5 Figure 2 
//Even the namings of inputs and outputs are all the same

module RegFile(
		input [3:0] r0addr,
		input [3:0] r1addr,
		input [3:0] waddr,
		input [63:0] wdata,
		input wena,
		input clk,
        input rst,
		output [63:0] r0data,
		output [63:0] r1data
    );

        wire [15:0] waddr_d;
        wire [15:0] wen;
        assign wen = waddr_d & {16{wena}};
        wire [63:0] DtoM [0:15];

    Decoder4to16 Decode(
        .A(waddr),
        .D(waddr_d),
        .E(1'b1)
    );

    genvar i;
    generate
        for (i=0;i<16;i=i+1) begin: FlipFlop
            FD64CE DFF (
                .d(wdata),
                .clk(clk),
                .clr(rst),
                .CE(wen[i]),
                .q(DtoM[i])
            );
        end

    endgenerate

    Mux_16to4_64bit r0 (
        .in0 (DtoM[0]),
        .in1 (DtoM[1]),
        .in2 (DtoM[2]),
        .in3 (DtoM[3]),
        .in4 (DtoM[4]),
        .in5 (DtoM[5]),
        .in6 (DtoM[6]),
        .in7 (DtoM[7]),
        .in8 (DtoM[8]),
        .in9 (DtoM[9]),
        .in10(DtoM[10]),
        .in11(DtoM[11]),
        .in12(DtoM[12]),
        .in13(DtoM[13]),
        .in14(DtoM[14]),
        .in15(DtoM[15]),
        .sel(r0addr),
        .out(r0data)
    );

    Mux_16to4_64bit r1 (
        .in0 (DtoM[0]),
        .in1 (DtoM[1]),
        .in2 (DtoM[2]),
        .in3 (DtoM[3]),
        .in4 (DtoM[4]),
        .in5 (DtoM[5]),
        .in6 (DtoM[6]),
        .in7 (DtoM[7]),
        .in8 (DtoM[8]),
        .in9 (DtoM[9]),
        .in10(DtoM[10]),
        .in11(DtoM[11]),
        .in12(DtoM[12]),
        .in13(DtoM[13]),
        .in14(DtoM[14]),
        .in15(DtoM[15]),
        .sel(r1addr),
        .out(r1data)
    );


endmodule
