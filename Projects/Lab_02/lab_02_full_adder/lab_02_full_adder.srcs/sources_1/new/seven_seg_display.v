`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2024 18:38:56
// Design Name: 
// Module Name: seven_seg_display
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

// Common Anode SSD
module seven_seg_display(input A3, A2, A1, A0, output a,b,c,d,e,f,g);

assign a = ~((A3|A1|(A2&A0)|(~A2&~A0)));
assign b = ~((~A2|(A1&A0)|(~A1&~A0)));
assign c = ~((A2|~A1|A0));
assign d = ~((A3|(~A2&A1)|(~A2&~A0)|(A1&~A0)|(A2&~A1&A0)));
assign e = ~(((A1&~A0)|(~A2&~A0)));
assign f = ~((A3|(~A1&~A0)|(A2&~A1)|(A2&~A0)));
assign g = ~((A3|(A2&~A1)|(~A2&A1)|(A1&~A0)));

endmodule
