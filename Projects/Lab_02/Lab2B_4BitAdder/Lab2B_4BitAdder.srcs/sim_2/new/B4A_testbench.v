`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 15:24:09
// Design Name: 
// Module Name: B4A_testbench
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


module B4A_testbench;

reg [3:0]A,B;
wire [3:0]S;
wire Cout;

FourBitAdder b4add(A,B,S,Cout);
initial begin

//Test Case 1 -- 4 + 5 = 9
A = 4'b0100; B = 4'b0101; #20;

//Test Case 2 -- 3 + 12 = 15
A = 4'b0011; B = 4'b1100; #20;

//Test Case 3 -- 4 + 12 = 16 (0 with carry)
A = 4'b0100; B=4'b1100; #20;

//Test Case 4 -- 13 + 10 = 23 (7 with carry)
A = 4'b1101; B=4'b1010; #20;

//Test Case 5 -- 0 + 1 = 1
A = 4'b0000; B=4'b0001; #20;

//Test Case 6 -- 15 + 15 = 30 (14 with carry)
A = 4'b1111; B=4'b1111; #20;

$finish;
end

endmodule
