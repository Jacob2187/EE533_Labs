`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:46 02/09/2026 
// Design Name: 
// Module Name:    OprSel16_4 
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
module ALU_32_9#(
      parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
   (
        
        input clk,
        input rst,

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
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out
    );


        reg [3:0] alu_s0;
        reg [63:0] A_s0;
        reg [63:0] B_s0;

// Software Registers for inputs A, B, aluctrl
        wire [63:0] A;
        wire [63:0] B;
        wire [31:0] aluctrl_extend;
// Hardware Registers for ALU outputs
        reg [63:0] Z;

wire [3:0] aluctrl;
assign [3:0] aluctrl = aluctrl_extend[3:0];

generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .REG_ADDR_WIDTH      (`IDS_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (5),                 // Number of sw regs
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
      .software_regs    ({aluctrl_extend,A[63:32],A[31:0],B[63:32],B[31:0]}),

      // --- HW regs interface
      .hardware_regs    ({Z[63:32],Z[31:0]}),

      .clk              (clk),
      .reset            (rst)
    );

always@(posedge clk)begin
    if (rst)begin
        alu_s0<=0;
        A_s0<=0;
        B_s0<=0;
    end
    else begin
        alu_s0<=aluctrl;
        A_s0<=A;
        B_s0<=B;
    end
end

        wire [63:0] add_C = A_s0 + B_s0;
        wire [63:0] sub_C = A_s0 - B_s0;
        wire [63:0] or_C = A_s0 | B_s0;
        wire [63:0] and_C = A_s0 & B_s0;
        wire [63:0] xnor_C = ~(A_s0 ^ B_s0);
        wire [63:0] shiftL_C = {A_s0[62:0], 1'b0};
        wire [63:0] shiftR_C = {1'b0, A_s0[63:1]};

        reg [63:0] shiftL_s1;
        reg [63:0] shiftR_s1;
        reg [63:0] or_s1;
        reg [63:0] and_s1;
        reg [63:0] xnor_s1;
        reg [63:0] sub_s1;
        reg [63:0] add_s1;
        reg [3:0] alu_s1;
        reg [63:0] A_s1;
        reg [63:0] B_s1;


always@(posedge clk)begin
    if (rst) begin
        shiftL_s1 <= 0;
        shiftR_s1 <= 0;
        or_s1 <= 0;
        and_s1 <= 0;
        xnor_s1 <= 0;
        sub_s1 <= 0;
        add_s1 <= 0; 
        alu_s1 <= alu_s0;
        A_s1 <= 0;
        B_s1 <=0;
    end
    else begin
        shiftL_s1 <= shiftL_C;
        shiftR_s1 <= shiftR_C;
        or_s1 <= or_C;
        and_s1 <= and_C;
        xnor_s1 <= xnor_C;
        sub_s1 <= sub_C;
        add_s1 <= add_C;
        alu_s1 <= alu_s0;
        A_s1 <= A_s0;
        B_s1 <= B_s0;
    end
end

        wire comp_shiftL = (shiftL_s1 == B_s1);
        wire comp_shiftR = (shiftR_s1 == B_s1);
        wire comp = (sub_s1==64'd0);

always@(posedge clk)begin
    if (rst)begin
        Z <= 0;
    end
    else begin
        case(alu_s1)
            default: Z <= 0;
            4'b0000: Z<= add_s1;
            4'b0001: Z<= sub_s1;
            4'b0010: Z<= and_s1;
            4'b0011: Z<= or_s1;
            4'b0100: Z<= xnor_s1;
            4'b0101: Z <= {63'd0, comp};
            4'b0110: begin  if (B_s1[0])begin
                                Z <= shiftL_s1;
                            end
                            else begin
                                Z <= shiftR_s1;
                            end
                     end
            4'b1111: Z <= {63'd0, comp_shiftL};
            4'b0111: Z <= {63'd0, comp_shiftR};
        endcase
    end
end



endmodule

/* always@(posedge clk) begin
    if (rst) begin
        Z <= 0;
    end
    else begin
        case(aluctrl)
            default: Z<=0;
            4'b0000: Z<= A+B;
            4'b0001: Z<= A+((~B)+1);
            4'b0010: Z<= A&B;
            4'b0011: Z<= A||B;
            4'b0100: Z<= ~(((~A)&B)+((~B)&A));
            4'b0101: begin 
                     if (~(A+((~B)+1)))
                         Z<=1;
                     else 
                         Z<=0;
            end
            4'b0110: begin if (B[0])begin
                         Z[63:1]<=A[62:0];
                         Z[0]<=0;
                     end
                     else begin
                         Z[62:0]<=A[63:1];
                         Z[63]<=0;
                     end
            end
            4'bX111: begin  if (aluctrl[3])begin
                                shiftpare[63:1]<=A[62:0];
                                shiftpare[0]<=0;
                                if (~(shiftpare+((~B)+1)))
                                    Z<=1;
                                else 
                                    Z<=0;
                            end
                            else begin
                                shiftpare[63:1]<=A[62:0];
                                shiftpare[63]<=0;
                                if (~(shiftpare+((~B)+1)))
                                    Z<=1;
                                else 
                                    Z<=0;
                            end
            end
            4'b1000: Z<=|string8pare_result;
            4'b1001: Z<=|string16pare_result;
            4'b1010: Z<=|string32pare_result;
        endcase
    end
end*/

/*genvar i8;
        genvar i16;
        genvar i32;

        generate
            for (i8=0;i8<57;i++)begin
                assign [7:0] pair = A_s0[i8+:8];
                wire string8pare_result[i8] = (pair == B_s0[0+:8]);
            end
        endgenerate

        generate
            for (i16=0;i16<49;i++)begin
                assign [15:0] pair = A_s0[i16+:16];
                wire string16pare_result[i16] = (pair == B_s0[0+:16]);
            end
        endgenerate

        generate
            for (i32=0;i32<33;i++)begin
                assign [31:0] pair = A_s0[i32+:32];
                wire string32pare_result[i32] = (pair == B_s0[0+:32]);
            end
        endgenerate

        reg [32:0] match32_s1;
        reg [48:0] match16_s1;
        reg [56:0] match8_s1;*/

