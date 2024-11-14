`timescale 1ns / 1ps

module Adder(
    input [w-1:0] a, b,
    output [w:0] s
    );
    
    parameter w = 8;
    
wire [w:0] carry;

assign carry[0] = 1'b0;

genvar i;
generate
    for(i = 0; i < w; i = i + 1) begin
        Full_Adder Si (a[i], b[i], carry[i], s[i], carry[i+1]);
    end
endgenerate

assign s[w] = carry[w];

endmodule
