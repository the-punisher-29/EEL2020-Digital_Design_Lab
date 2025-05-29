`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 14:55:42
// Design Name: 
// Module Name: add_display
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
// Full Adder Module
module full_adder(input X, input Y, input Cin, output Sum, output Cout);
  assign {Cout, Sum} = X + Y + Cin;
endmodule

// 4-bit Adder Module
module four_bit_adder(input [3:0] A, input [3:0] B, output [3:0] S, output Co);
  wire [3:0] C;
  full_adder fa0(A[0], B[0], 0, S[0], C[0]);
  full_adder fa1(A[1], B[1], C[0], S[1], C[1]);
  full_adder fa2(A[2], B[2], C[1], S[2], C[2]);
  full_adder fa3(A[3], B[3], C[2], S[3], Co);
endmodule

// Converting binary to decimal and extracting individual digits
module BinaryToDecimal(
    input [4:0] binary,
    output reg [4:0] decimal,
    output reg [3:0] dec_tens,
    output reg [3:0] dec_ones
);
integer i;
always @(*) begin
    decimal = 0;
    for (i = 0; i < 5; i = i + 1) begin
        decimal = decimal + (binary[i] << i);
    end
    dec_tens = decimal / 10;
    dec_ones = decimal % 10;
end

endmodule

// BCD to Seven Segment Decoder
module BCD_to_SevenSegment(input [3:0] bcd_input, output reg [6:0] seven_segment_output);

  always @(bcd_input) begin
    case (bcd_input)
//    for Common Anode SSD
      4'b0000: seven_segment_output = 7'b0111111; // 0
      4'b0001: seven_segment_output = 7'b0000110; // 1
      4'b0010: seven_segment_output = 7'b1011011; // 2
      4'b0011: seven_segment_output = 7'b1001111; // 3
      4'b0100: seven_segment_output = 7'b1100110; // 4
      4'b0101: seven_segment_output = 7'b1101101; // 5
      4'b0110: seven_segment_output = 7'b1111101; // 6
      4'b0111: seven_segment_output = 7'b0000111; // 7
      4'b1000: seven_segment_output = 7'b1111111; // 8
      4'b1001: seven_segment_output = 7'b1101111; // 9
      default: seven_segment_output = 7'b1111100; // Display E for undefined BCD input
    endcase
  end
 
 endmodule
 
module disp_add(input [3:0] dec_tens, input [3:0] dec_ones, output [6:0] s_tens, output [6:0] s_ones);
    BCD_to_SevenSegment tens_(dec_tens, s_tens);
    BCD_to_SevenSegment ones_(dec_ones, s_ones);
endmodule

module fourbitadd_display(input [3:0] A, input [3:0] B, output [6:0] SSD_tens, output [6:0] SSD_ones);
    wire [3:0] s; wire c;
    wire [3:0] dec, d_tens, d_ones;
    four_bit_adder FourBAdd(A, B, s, c);
    BinaryToDecimal bin2dec({c,s}, dec, d_tens, d_ones);
    disp_add D_and_A(d_tens, d_ones, SSD_tens, SSD_ones);
endmodule
