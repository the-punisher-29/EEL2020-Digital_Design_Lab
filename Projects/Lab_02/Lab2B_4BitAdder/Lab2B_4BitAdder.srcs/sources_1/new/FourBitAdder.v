`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 15:12:08
// Design Name: 
// Module Name: FourBitAdder
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

// Full Adder

module full_adder(input X,Y,Cin, output Sum,Cout);
assign {Cout,Sum}=X+Y+Cin;
endmodule


// Four Bit Adder
module FourBitAdder(input [3:0]A,[3:0]B, output [3:0]S,Co);
wire [3:0]C;
full_adder fa0(A[0],B[0],0,S[0],C[0]);
full_adder fa1(A[1],B[1],C[0],S[1],C[1]);
full_adder fa2(A[2],B[2],C[1],S[2],C[2]);
full_adder fa3(A[3],B[3],C[2],S[3],Co);
endmodule
