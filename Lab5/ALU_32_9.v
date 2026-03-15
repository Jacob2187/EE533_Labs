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
module ALU_32_9(
        input [63:0] A,
        input [63:0] B,
        input [3:0] aluctrl,
        input clk,
        input rst,
        output reg [63:0] Z
    );

        wire [63:0] shiftpareL;
		  assign shiftpareL[63:1]=A[62:0];
        assign shiftpareL[0]=0;
		  wire [63:0] shiftpareR;
		  assign shiftpareR[62:0]=A[63:1];
        assign shiftpareR[63]=0;
        wire [56:0] string8pare_result;
        wire [48:0] string16pare_result;
        wire [32:0] string32pare_result;

        genvar i8;
        genvar i16;
        genvar i32;

        generate
            for (i8=0;i8<57;i8=i8+1)begin : cmp8
                wire [7:0] pair = A[i8+:8];
                assign string8pare_result[i8] = (pair == B[0+:8]);
            end
        endgenerate

        generate
            for (i16=0;i16<49;i16=i16+1)begin : cmp16
                wire [15:0] pair = A[i16+:16];
                assign string16pare_result[i16] = (pair == B[0+:16]);
            end
        endgenerate

        generate
            for (i32=0;i32<33;i32=i32+1)begin : cmp32
                wire [31:0] pair = A[i32+:32];
                assign string32pare_result[i32] = (pair == B[0+:32]);
            end
        endgenerate

always@(posedge clk) begin
    if (rst) begin
        Z <= 0;
    end
    else begin
        case(aluctrl)
            default: Z<=0;
            4'b0000: Z<= A+B;
            4'b0001: Z<= A+((~B)+1);
            4'b0010: Z<= A&B;
            4'b0011: Z<= A|B;
            4'b0100: Z<= ~(((~A)&B)+((~B)&A));
            4'b0101: begin 
                     if (A==B)
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
            4'b0111: begin  if ((shiftpareR+((~B)+1))==0)
										Z<=1;
									 else
										Z<=0;
							end
				4'b1111: begin  if ((shiftpareL+((~B)+1))==0)
										Z<=1;
									 else
										Z<=0;
							end
            4'b1000: Z<=|string8pare_result;
            4'b1001: Z<=|string16pare_result;
            4'b1010: Z<=|string32pare_result;
        endcase
    end
end


endmodule
