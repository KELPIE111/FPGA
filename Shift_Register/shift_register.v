`timescale 1ns / 1ps

module shift_register(
    input clk,
    input [1:0] S,
    input [7:0] D,
    output reg [7:0] Q 
    );
    
    always @ (posedge clk)
    if (S[1])
        Q <= D;
    else if (S[0])
        Q <= {Q[6:0], Q[7]};
    else
        Q <= {Q[0], Q[7:1]};
    
endmodule
