`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 14:29:58
// Design Name: 
// Module Name: fourbitadd_display
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
module full_adder (input X, input Y, input Cin, output Sum, output Cout);
assign {Cout, Sum}=X + Y + Cin;
endmodule

//4-bit Ada Modul
module four_bit_adder(input [3:0] _A, input [3:0] _B, output [3:0] S, output Co);
wire [3:0] C;
full_adder fa0(_A[0], _B[0], 0, S[0], C[0]);
full_adder fal(_A[1], _B[1], C[0], S[1], C[1]);
full_adder fa2(_A[2], _B[2], C[1], S[2], C[2]);
full_adder fa3(_A[3], _B[3], C[2], S[3], Co);
endmodule

// Converting binary to decimal and extracting Individual digita
module BinaryToDecimal(input [4:0] binary, output reg [4:0] decimal, output reg [3:0] dec_tens, output reg [3:0] dec_ones);
always @(binary)
begin
case (binary)
5'b00000: begin decimal= 5'd0; dec_tens=4'b0000;dec_ones=4'b0000;end//0
5'b00001: begin decimal= 5'd1; dec_tens=4'b0000;dec_ones=4'b0001;end//1
5'b00010: begin decimal= 5'd2; dec_tens=4'b0000;dec_ones=4'b0010;end//2
5'b00011: begin decimal= 5'd3; dec_tens=4'b0000;dec_ones=4'b0011;end//3
5'b00100: begin decimal= 5'd4; dec_tens=4'b0000;dec_ones=4'b0100;end//4
5'b00101: begin decimal= 5'd5; dec_tens=4'b0000;dec_ones=4'b0101;end//5
5'b00110: begin decimal= 5'd6; dec_tens=4'b0000;dec_ones=4'b0110;end//6
5'b00111: begin decimal= 5'd7; dec_tens=4'b0000;dec_ones=4'b0111;end//7
5'b01000: begin decimal= 5'd8; dec_tens=4'b0000;dec_ones=4'b1000;end//8
5'b01001: begin decimal= 5'd9; dec_tens=4'b0000;dec_ones=4'b1001;end//9
5'b01010: begin decimal= 5'd10; dec_tens=4'b0001;dec_ones=4'b0000;end//10
5'b01011: begin decimal= 5'd11; dec_tens=4'b0001;dec_ones=4'b0001;end//11
5'b01100: begin decimal= 5'd12; dec_tens=4'b0001;dec_ones=4'b0010;end//12
5'b01101: begin decimal= 5'd13; dec_tens=4'b0001;dec_ones=4'b0011;end//13
5'b01110: begin decimal= 5'd14; dec_tens=4'b0001;dec_ones=4'b0100;end//14
5'b01111: begin decimal= 5'd15; dec_tens=4'b0001;dec_ones=4'b0101;end//15
5'b10000: begin decimal= 5'd16; dec_tens=4'b0001;dec_ones=4'b0110;end//16
5'b10001: begin decimal= 5'd17; dec_tens=4'b0001;dec_ones=4'b0111;end//17
5'b10010: begin decimal= 5'd18; dec_tens=4'b0001;dec_ones=4'b1000;end//18
5'b10011: begin decimal= 5'd19; dec_tens=4'b0001;dec_ones=4'b1001;end//19
5'b10100: begin decimal= 5'd20; dec_tens=4'b0010;dec_ones=4'b0000;end//20
5'b10101: begin decimal= 5'd21; dec_tens=4'b0010;dec_ones=4'b0001;end//21
5'b10110: begin decimal= 5'd22; dec_tens=4'b0010;dec_ones=4'b0010;end//22
5'b10111: begin decimal= 5'd23; dec_tens=4'b0010;dec_ones=4'b0011;end//23
5'b11000: begin decimal= 5'd24; dec_tens=4'b0010;dec_ones=4'b0100;end//24
5'b11001: begin decimal= 5'd25; dec_tens=4'b0010;dec_ones=4'b0101;end//25
5'b11010: begin decimal= 5'd26; dec_tens=4'b0010;dec_ones=4'b0110;end//26
5'b11011: begin decimal= 5'd27; dec_tens=4'b0010;dec_ones=4'b0111;end//27
5'b11100: begin decimal= 5'd28; dec_tens=4'b0010;dec_ones=4'b1000;end//28
5'b11101: begin decimal= 5'd29; dec_tens=4'b0010;dec_ones=4'b1001;end//29
5'b11110: begin decimal= 5'd30; dec_tens=4'b0011;dec_ones=4'b0000;end//30
5'b11111: begin decimal= 5'd31; dec_tens=4'b0011;dec_ones=4'b0001;end//31
default: begin decimal =5'dx; dec_tens = 4'bx; dec_ones =4'bx; end
endcase
$display("Tens: %d", dec_tens);
$display("Ones: %d", dec_ones);
end
endmodule

// BCD to Seven Segment Decoder
module BCD_to_SevenSegment (input [3:0] bcd_input, output reg [6:0] seven_segment_output);
always @(bcd_input) begin
case (bcd_input)
//for Common cathode SSD
4'b0000: seven_segment_output =7'b0111111;
4'b0001: seven_segment_output =7'b0000110; 
4'b0010: seven_segment_output =7'b1011011; 
4'b0011: seven_segment_output =7'b1001111; 
4'b0100: seven_segment_output =7'b1100110;
4'b0101: seven_segment_output =7'b1101101; 
4'b0110: seven_segment_output =7'b1111101; 
4'b0111: seven_segment_output =7'b0000111; 
4'b1000: seven_segment_output =7'b1111111; 
4'b1001: seven_segment_output =7'b1101111; 
default:seven_segment_output =7'b1111100;
 endcase
end
endmodule

module disp_add(input [3:0] dec_tens, input [3:0] dec_ones, output [6:0] s_tens, output [6:0] s_ones);
BCD_to_SevenSegment tens_(dec_tens, s_tens); 
BCD_to_SevenSegment ones_(dec_ones, s_ones);
endmodule

module fourbitadd_display(input [3:0] A, input [3:0] B, output [6:0] SSD_tens, output [6:0] SSD_ones);
wire [3:0] s;
wire c;
wire [3:0] dec, d_tens, d_ones;
four_bit_adder FourBAdd (A, B, s, c);
BinaryToDecimal bin2dec({c,s}, dec, d_tens, d_ones);
disp_add D_and_A(d_tens, d_ones, SSD_tens, SSD_ones);
endmodule
