`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2024 23:20:02
// Design Name: 
// Module Name: testMulti
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


module testMulti();

reg [3:0] A;    
wire [6:0] prod;

multi6 uut (
    .A(A),
    .prod(prod)
);
    
    
initial begin
    A = 4'b1010; #10;
    A = 4'b0011; #10;
    A = 4'b1000; #10;
    A = 4'b1111; #10;
     
    $finish;
end

endmodule
