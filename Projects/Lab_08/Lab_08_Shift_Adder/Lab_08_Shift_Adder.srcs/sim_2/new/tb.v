`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2024 10:25:03
// Design Name: 
// Module Name: sa_testbench
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

module tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Inputs
  reg [3:0] DATA;
  reg loadA, loadB, start, clk, rst;

  // Outputs
  wire [3:0] regA, regB;
  wire co, cout_f;

  // Instantiate the module under test
  serialAdder dut (
    .DATA(DATA),
    .loadA(loadA),
    .loadB(loadB),
    .start(start),
    .clk(clk),
    .rst(rst),
    .regA(regA),
    .regB(regB),
    .co(co),
    .cout_f(cout_f)
  );

  // Clock generation
  always begin
    #((CLK_PERIOD) / 2) clk = ~clk; // Toggle the clock every half period
  end

  // Testbench stimulus
  initial begin
    // Initialize inputs
    DATA = 4'b0000;
    loadA = 0;
    loadB = 0;
    start = 0;
    clk = 0;
    rst = 1;

    // Reset the DUT
    #10 rst = 0;

    // Load inputs A and B
    #10 loadA = 1;
    DATA = 4'b1011; // Example data for input A
    #10 loadA = 0;
    #10 loadB = 1;
    DATA = 4'b0110; // Example data for input B
    #10 loadB = 0;

    // Start the operation
    #10 start = 1;

    // Wait for the operation to complete
    #100 $finish;
  end

  // Monitor for displaying outputs
  always @(posedge clk) begin
    $display("regA = %b, regB = %b, co = %b, cout_f = %b", regA, regB, co, cout_f);
  end

endmodule