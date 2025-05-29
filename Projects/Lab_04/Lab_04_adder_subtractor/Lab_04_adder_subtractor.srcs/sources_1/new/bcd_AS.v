`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 19:38:49
// Design Name: 
// Module Name: bcd_AS
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


module bcd_AS (
    input [3:0] A,
    input [3:0] B,
    input M,
    output reg [4:0] out_value,
    output reg [6:0] seg_out,
    output reg C_sign
);

always @(*)
begin
    if (A <= 4'b1001 && B <= 4'b1001) begin
        if (M == 1) begin
            if (A >= B) begin
                out_value = A - B;
                C_sign = 0;
            end
            else begin
                out_value = B - A;
                C_sign = 1;
            end
        end
        else begin
            out_value = A + B;
            if (out_value > 4'b1001) begin
                C_sign = 1;
                out_value = out_value + 4'b0110;
            end
            else
                C_sign = 0;
        end
        $display ("A = %b, B = %b, Subtraction?: %b, C_out_Sign: %b, Output value: %d", A, B, M, C_sign, out_value);
    end
    else begin
        out_value = 4'b1111;
        $display ("Invalid BCD input");
    end
end

always @(*)
begin
    case (out_value[3:0])
        4'b0000: seg_out = 7'b1000000; // Display 0
        4'b0001: seg_out = 7'b1111001; // Display 1
        4'b0010: seg_out = 7'b0100100; // Display 2
        4'b0011: seg_out = 7'b0110000; // Display 3 
        4'b0100: seg_out = 7'b0011001; // Display 4
        4'b0101: seg_out = 7'b0010010; // Display 5
        4'b0110: seg_out = 7'b0000010; // Display 6
        4'b0111: seg_out = 7'b1111000; // Display 7
        4'b1000: seg_out = 7'b0000000; // Display 8
        4'b1001: seg_out = 7'b0010000; // Display 9
        default: seg_out = 7'b1111111; // Blank display for other values
    endcase
end

endmodule


module add_sub (input [3:0] A, [3:0] B, input M, output [6:0] seg_out, output c_out_sign);
BCD_Addition_Subtraction addition_sub (A, B, M, out_val, seg_out, c_out_sign);
endmodule