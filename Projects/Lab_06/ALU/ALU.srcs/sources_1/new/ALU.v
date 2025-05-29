`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 14:51:06
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU(input [3:0]A, [3:0]B, [2:0]X, output reg [3:0]res, reg carry);
always @(*) begin
case(X)
3'b000: {carry,res} = {0, 4'b0000};
3'b001: {carry,res} = A+B;
3'b010: {carry,res} = A-B;
3'b011: {carry,res} = {0, A&B};
3'b100: {carry,res} = {0, A|B};
3'b101: {carry,res} = {0, A^B};
3'b110: {carry,res} = {0, ~(A^B)};
3'b111: {carry,res} = {0, 4'b1111};
endcase
end
endmodule
