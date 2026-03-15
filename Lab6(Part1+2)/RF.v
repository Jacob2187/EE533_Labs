`timescale 1ns / 1ps

module RF
(
    input clk,
    input rst,
    input wena,
    input [63:0] wdata,
    input [2:0] waddr,
    input [2:0] r0addr,
    input [2:0] r1addr,
	 input [1:0] thread_ID,
	 input [1:0] thread_WB,

    output reg signed [63:0] r0data,
    output reg signed [63:0] r1data
);

    reg signed [63:0] RF [7:0];
	 
	 wire [4:0] r0addr_thr;
	 assign r0addr_thr = {thread_ID, r0addr};
	 wire [4:0] r1addr_thr;
	 assign r1addr_thr = {thread_ID, r1addr};
	 wire [4:0] waddr_thr;
	 assign waddr_thr = {thread_WB, waddr};
	 
	integer i;

    always @(posedge clk) begin
        if (rst == 1)
        begin
            for (i = 0; i < 8; i = i + 1) begin
                RF[i] <= 64'b0;
            end
        end
        else if (wena == 1)
        begin
            RF[waddr] <= wdata;
        end
    end

    always @(*) begin
        r0data = ((waddr_thr == r0addr_thr) && wena) ? RF[waddr_thr] : RF[r0addr_thr];
        r1data = ((waddr_thr == r1addr_thr) && wena) ? RF[waddr_thr] : RF[r1addr_thr];
    end


endmodule