`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 11:26:08
// Design Name: 
// Module Name: shiftRegister
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


module shiftRegister(input [3:0] data_in,
                     input [1:0] selection_code,
                     output reg [6:0] data_out);

always @(*)
begin
    case(selection_code)
        2'b00: data_out = {2'b00, data_in, 1'b0}; // No change
        2'b01: data_out = {1'b0, data_in, 2'b00}; // 1-bit left shift
        2'b10: data_out = {data_in, 3'b000}; // 2-bit left shift
        2'b11: data_out = {3'b000, data_in}; // 1-bit right shift
        default: data_out = {2'b00, data_in, 1'b0}; // No change
    endcase
end
endmodule
