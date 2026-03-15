`timescale 1ns / 1ps
// Behavioral model of a 64-bit D flip-flop with clock enable and synchronous clear.
// This models the vendor FD64CE primitive for simulation.
module FD64CE (
    input  [63:0] d,
    input         clk,
    input         clr,  // active-high synchronous clear (modeled as priority)
    input         CE,   // clock enable
    output reg [63:0] q
);
    always @(posedge clk) begin
        if (clr)
            q <= 64'b0;
        else if (CE)
            q <= d;
    end
endmodule


// Testbench: instantiate 16 FD64CE using generate and drive them
module tb_FD64CE_array;

    reg         clk;
    reg         clr;
    reg  [15:0] ce;                 // individual enables for each DFF
    reg  [63:0] d_in [0:15];        // per-instance 64-bit data inputs
    wire [63:0] q   [0:15];         // per-instance outputs
	reg [7:0] temp8;
	reg [7:0] temp9;

	

    // clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i, j;

    // instantiate 16 FD64CE using generate
    genvar gi;
    generate
        for (gi = 0; gi < 16; gi = gi + 1) begin : bits
            FD64CE dff_inst (
                .d  (d_in[gi]),
                .clk(clk),
                .clr(clr),
                .CE (ce[gi]),
                .q  (q[gi])
            );
        end
    endgenerate

    // Test sequence
    initial begin
        // initialize
        clr = 1'b1;
        ce  = 16'h0000;

        // initialize d_in to distinct known values
        // use safe ISE-friendly replication: {8{i[7:0]}}
        for (i = 0; i < 16; i = i + 1) begin
            d_in[i] = {8{i[7:0]}}; // yields 0x0000... up to 0x0F0F...
        end

        // let a couple of cycles pass with clear asserted
        #12;   // some time so you can see initial state in waveform
        clr = 1'b0;
        #8;

        // ---- Test 1: Basic write with all enables asserted ----
        ce = 16'hFFFF;         // enable all DFFs
        // drive new unique patterns before rising edge
        for (i = 0; i < 16; i = i + 1)
            temp8 = i + 1;
d_in[i] = {8{temp8}};
 // patterns 0x0101.., 0x0202..., etc.

        // wait one clock edge so DFFs capture d_in
        #6;    // half cycle: ensure we are before posedge
        #5;    // posedge occurs here; DFFs should latch
        #4;    // small settle window

        // At this time (after the posedge) q[*] should equal the new d_in[*] values

        // ---- Test 2: Disable half of the DFFs, change d_in, and capture again ----
        // disable DFFs 0..7, enable 8..15
        ce = 16'hFF00; // bit[15:8] = 1, bit[7:0] = 0

        // change d_in values
        for (i = 0; i < 16; i = i + 1)
            temp9 = i + 1;
d_in[i] = {8{temp9}};
 // new distinct patterns 0x10,0x11,...

        // wait one clock to capture only enabled ones (8..15)
        #5;   // posedge -> updates q[8..15] only
        #5;

        // ---- Test 3: Pulse clear to reset all q ----
        clr = 1'b1;
        #5;   // posedge with clr asserted -> synchronous clear will zero q
        #5;
        clr = 1'b0;
        #10;

        // ---- Test 4: Enable only lower half, write new values ----
        ce = 16'h00FF; // enable 0..7 only
        for (i = 0; i < 8; i = i + 1)
            d_in[i] = 64'hDEADBEEFDEADBEEF ^ (i); // distinct patterns for 0..7

        // wait one clock to capture
        #5;
        #5;

        // leave simulation running so you can inspect waveform
        #50;
        $stop;
    end

endmodule
