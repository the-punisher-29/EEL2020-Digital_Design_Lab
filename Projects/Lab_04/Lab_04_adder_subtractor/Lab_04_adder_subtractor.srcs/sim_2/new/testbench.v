`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 19:59:41
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


module testbench;
    reg [3:0] A; 
    reg [3:0] B; 
    reg M; 
    wire C_sign; 
    wire [4:0] out_value;
    wire [6:0] seg_out; 

    bcd_AS uut (
        .A(A),
        .B(B),
        .M(M),
        .out_value(out_value),
        .seg_out(seg_out),
        .C_sign(C_sign)
    );

    
    initial begin
        // Test case 1
        M = 1;       // Subtractor
        A = 4'b1001; // 9 
        B = 4'b0100; // 4
        // 9 - 6 = 5
        // out_value = 5, c_sign = 0
        #40;

        // Test case 2
        M = 1;       // Subtractor
        A = 4'b0100; // 4
        B = 4'b1000; // 8
        // 4 - 8 = -4
        // out_value = 4, c_sign = 1
        #40;

        // Test case 3
        M = 1;       // Subtractor
        A = 4'b1011; // Invalid BCD 
        B = 4'b0101; // 5
        // Blank SSD display
        #40;

        // Test case 4
        M = 0;       // Adder
        A = 4'b0010; // 2 
        B = 4'b0110; // 6
        // 2 + 6 = 8
        // out_value = 8, c_sign = 0
        #40;

        // Test case 5
        M = 0;       // Adder
        A = 4'b0111; // 7
        B = 4'b0110; // 6
        // 7 + 6 = 13
        // out_value = 13+6 = 19, c_sign = 1
        #40;

        // Test case 6
        M = 0;       // Adder
        A = 4'b1001; // 9 
        B = 4'b1001; // 9
        // 9 + 9 = 18
        // out_value = 18+6 = 24, c_sign = 1
        #40;
        
        $finish;
    end
endmodule
