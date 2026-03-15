`timescale 1ns / 1ps
module tb_RegFile_minimal;

    // DUT ports
    reg  [3:0]  r0addr;
    reg  [3:0]  r1addr;
    reg  [3:0]  waddr;
    reg  [63:0] wdata;
    reg         wena;
    reg         clk;
    reg         rst;
    wire [63:0] r0data;
    wire [63:0] r1data;

    // Instantiate DUT
    RegFile uut (
        .r0addr(r0addr),
        .r1addr(r1addr),
        .waddr(waddr),
        .wdata(wdata),
        .wena(wena),
        .clk(clk),
        .rst(rst),
        .r0data(r0data),
        .r1data(r1data)
    );

    // Clock: 10 ns period (toggle every 5 ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i;

    initial begin
        // Initial values
        rst   = 1;
        r0addr = 4'd0;
        r1addr = 4'd0;
        waddr  = 4'd0;
        wdata  = 64'd0;
        wena   = 1'b0;

        // Hold reset for 20 ns
        #20;
        rst = 0;
        #10;

        // --------------------------
        // WRITE PHASE: write registers 0..15
        // Each write: set waddr, wdata, wena=1, wait one cycle (#10)
        // Pattern: wdata = repeating byte of index: 0xNNNN...NN
        // --------------------------
        for (i = 0; i < 16; i = i + 1) begin
            waddr = i[3:0];
            wdata = {8{i[7:0]}}; // replicate byte value i eight times
            wena  = 1'b1;
            #10; // wait one clock period (a rising edge occurs inside this)
        end

        // disable writes
        wena = 1'b0;
        #10;

        // --------------------------
        // READ PHASE: sample read ports in several combinations
        // Each vector applied for #10 so you can inspect waveform
        // --------------------------
        // simple read-back: r0 reads reg0..7, r1 reads reg8..15
        r0addr = 4'd0; r1addr = 4'd8; #10;
        r0addr = 4'd1; r1addr = 4'd9; #10;
        r0addr = 4'd2; r1addr = 4'd10; #10;
        r0addr = 4'd3; r1addr = 4'd11; #10;
        r0addr = 4'd4; r1addr = 4'd12; #10;
        r0addr = 4'd5; r1addr = 4'd13; #10;
        r0addr = 4'd6; r1addr = 4'd14; #10;
        r0addr = 4'd7; r1addr = 4'd15; #10;

        // random-ish combos
        r0addr = 4'd15; r1addr = 4'd0; #10;
        r0addr = 4'd8;  r1addr = 4'd7; #10;
        r0addr = 4'd10; r1addr = 4'd3; #10;

        // --------------------------
        // READ-WRITE HAZARD CHECK (write to reg5 while reading it)
        // - Write new data into register 5, while reading r0=r5 and r1=some other.
        //   This lets you inspect how your regfile behaves on read-after-write.
        // --------------------------
        // Set new wdata for reg5 and enable write for one cycle
        waddr = 4'd5;
        wdata = 64'hDEADBEEFDEADBEEF;
        wena  = 1'b1;
        r0addr = 4'd5;  // read port 0 is also pointing to reg5
        r1addr = 4'd1;  // another read port
        #10; // sample during/after write
        wena = 1'b0;
        #10;

        // Final sanity reads
        r0addr = 4'd5; r1addr = 4'd10; #10;
        r0addr = 4'd0; r1addr = 4'd15; #10;

        // leave waveform available
        $stop;
    end

endmodule
