`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 14:27:30
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
reg [1:0] A, B;
wire [3:0] P;
two_bit_multiplier tb(.A(A), .B(B),.P(P));

initial begin
// Test 1 -- 0*2 = 0
A=2'b00;
B =2'b10;
#10

// Test 2 -- 3*1 = 3
A=2'b11;
B=2'b01;
#10

// Test 3 -- 2*3 = 6
A=2'b10;
B=2'b11;
#10

// Test 4 -- 3*0 = 0
A=2'b11;
B=2'b00;
#10

// Test 5 -- 2*2 = 4
A=2'b10;
B=2'b10;
#10

// Test 6 -- 1*2 = 2
A=2'b01;
B=2'b10;
#10

// Test 7 -- 2*1 = 2
A=2'b10;
B=2'b01;
#10

// Test 8 -- 3*3 = 9
A=2'b11;
B=2'b11;
#10

$finish;
end
endmodule