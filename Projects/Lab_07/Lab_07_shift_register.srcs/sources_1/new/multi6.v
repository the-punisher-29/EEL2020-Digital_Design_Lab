`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2024 23:09:44
// Design Name: 
// Module Name: multi6
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


module multi6(input [3:0]A,
              output [6:0] prod);

wire  [5:0]Ao, Aoo;

shifter6 shift1(A,01,Ao);
shifter6 shift2(A,10,Aoo);

assign prod = Ao+Aoo;

endmodule
