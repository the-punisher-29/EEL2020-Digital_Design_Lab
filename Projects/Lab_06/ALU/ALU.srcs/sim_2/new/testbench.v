`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 15:01:04
// Design Name: 
// Module Name: testbench
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


module testbench();
reg [3:0]A;
reg [3:0]B;
reg [2:0]X;
wire carry;
wire [3:0]res;
ALU uu(.A(A), .B(B), .X(X), .carry(carry), .res(res));

initial begin
A = 4'b1001; B = 4'b1110;
X = 3'b000;#10;
X = 3'b001;#10;
X = 3'b010;#10;
X = 3'b011;#10;
X = 3'b100;#10;
X = 3'b101;#10;
X = 3'b110;#10;
X = 3'b111;#10;

A = 4'b1010; B = 4'b0101;
X = 3'b000;#10;
X = 3'b001;#10;
X = 3'b010;#10;
X = 3'b011;#10;
X = 3'b100;#10;
X = 3'b101;#10;
X = 3'b110;#10;
X = 3'b111;#10;

$finish;
end
endmodule
