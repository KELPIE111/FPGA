`timescale 1ns / 1ps

module PISO(
    input clk,
    input load,
    input [3:0] D,
    input Din,
    output Qout,
    output [3:0] Q_all
    );
    
    reg [3:0] Q = 0;
    
    always @ (posedge clk)begin
        if (load)
            Q <= D;
        else
            Q <= {Q[2:0], Din};  
    end
assign Qout = Q[3];
assign Q_all = Q; 
endmodule
