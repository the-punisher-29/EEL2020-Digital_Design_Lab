`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 15:41:03
// Design Name: 
// Module Name: ha_testbench
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


module ha_testbench;
reg test_a, test_b;
wire test_s, test_c;
half_adder HA1(test_a, test_b, test_s, test_c);

initial begin
test_a=0;test_b=0; #10
test_a=0;test_b=1; #10
test_a=1;test_b=0; #10
test_a=1;test_b=1; #10
$finish();
end

endmodule
