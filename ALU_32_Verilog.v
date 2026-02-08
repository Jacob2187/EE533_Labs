`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:56:40 01/26/2026 
// Design Name: 
// Module Name:    ALU_32_Verilog 
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
module ALU_32_Verilog(A, B, EN, Opr, S, Equality
    );
		
		input [31:0] A;
		input [31:0] B;
		input EN;
		input [1:0] Opr;
		output [31:0] S;
		output Equality;
		
		reg Equality;
		reg [31:0] S;
		
always @(*) begin
		case (Opr)
				0	: // 2'b00 for Addition
				  begin
						S = A+B;
						if (S==0)
							Equality = 1;
						else
							Equality = 0;
				  end
				1	: //2'b01  for left shift by 1        
				  begin
						S = A+A;
							if (S==0)
								Equality = 1;
							else
								Equality = 0;
				  end 
				  
				2	: // 2'b10 Logical OR Function 
					begin
						S = A-B;
						if (S==0)
							Equality = 1;
					else
						Equality = 0;
					end
				3	: // 2'b11 Logical AND Function 
					begin
						S = A-B;
						if (S==0)
							Equality = 1;
						else
							Equality = 0;
					end
						
		  endcase
		  
	   
end
		

endmodule
