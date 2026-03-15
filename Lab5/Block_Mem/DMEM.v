`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:42 02/17/2026 
// Design Name: 
// Module Name:    DMEM 
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
module DMEM#(
      parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
   (
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,
        input clk,
        input rst
    );

    reg [31 : 0] addra;
    reg [31 : 0] addrb;
    reg [63 : 0] dina;
    reg [63 : 0] doutb;
    reg enb;
    reg wea;

    wire [31:0] addrw;
    wire [31:0] addrr;
    wire [31:0] wdata_hi;
    wire [31:0] wdata_lo;
    wire [31:0] wen;
    wire [31:0] ren;

    reg [31:0] rdata_hi;
    reg [31:0] rdata_lo;

always@(posedge clk)begin
    if(rst)begin
        addra<=0;
        addrb<=0;
        dina<=0;
        doutb<=0;
        enb<=0;
        wea<=0;
    end
    else
        if(wen[0])begin
            addra<=addrw;
            wea<=1'b1;
            enb<=1'b0;
            dina[63:32]<=wdata_hi;
            dina[31:0]<=wdata_lo;
        end
        else if(ren[0])begin
            wea<=1'b0;
            enb<=1;
            addrb<=addrr;
            rdata_hi <= doutb[63:32];
            rdata_lo <= doutb[31:0];
        end
        else begin
            addra<=addra;
            addrb<=addrb;
            dina<=dina;
            doutb<=doutb;
            enb<=enb;
            wea<=wea;
        end
end

    Block_RAM Dmemory(
        .addra(addra[7:0]),
        .addrb(addrb[7:0]),
        .clka(clk),
        .clkb(clk),
        .doutb(doutb),
        .wea(wea),
        .enb(enb),
        .dina(dina)
    );

generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`DMEM_BLOCK_ADDR),// Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`DMEM_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (6),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (2)                  // Number of hw regs
   ) module_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    ({addrw, addrr, wdata_hi, wdata_lo, wen, ren}),

      // --- HW regs interface
      .hardware_regs    (rdata_hi, rdata_lo),

      .clk              (clk),
      .reset            (rst)
    );

endmodule
