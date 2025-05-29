`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2024 15:36:53
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


module testbench();

    reg [3:0] data_in;
    reg [1:0] selection_code;
    
    wire [5:0] data_out;
    
    shifter6 uut (
        .data_in(data_in),
        .selection_code(selection_code),
        .data_out(data_out)
    );
    
    
    initial begin
        data_in = 4'b1010;
        
        //No change
        selection_code = 2'b00;
        #10;
        
        //1-bit left shift
        selection_code = 2'b01;
        #10;
        
        //2-bit left shift
        selection_code = 2'b10;
        #10;
        
        //1-bit right shift
        selection_code = 2'b11;
        #10;
        
        // Changing input
        data_in = 4'b1101;
        
        //No change
        selection_code = 2'b00;
        #10;
        
        //1-bit left shift
        selection_code = 2'b01;
        #10;
        
        //2-bit left shift
        selection_code = 2'b10;
        #10;
        
        //1-bit right shift
        selection_code = 2'b11;
        #10;
        
        $finish;
    end

endmodule
