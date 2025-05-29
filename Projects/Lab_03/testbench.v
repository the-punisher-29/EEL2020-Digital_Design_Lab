module testbench;
reg [3:0] A, B;
wire [3:0] sum;
wire Cout;
wire [4:0] decimal;
wire [3:0] d_tens, d_ones;
wire [6:0] seg_tens, seg_ones;
four_bit_adder FourBAdder (A, B, sum, Cout);
BinaryToDecimal BtoD ({Cout, sum}, decimal, d_tens, d_ones);
disp_add add4bit_display(d_tens, d_ones, seg_tens, seg_ones);
// Test values
initial begin
// Test Case 3+5
A=4'b0011;
B=4'b0101;
#20;

A=4'b1100;
B=4'b1010;
#20;

A=4'b0111;
B=4'b1001;
#20;

A=4'b1111;
B=4'b0011;
#20;

A=4'b1000;
B=4'b0111;
#20;

A=4'b1111;
B=4'b1111;
#20;
$finish();
end
endmodule

