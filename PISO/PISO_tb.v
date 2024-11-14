`timescale 1ns / 1ps

module PISO_tb;

reg clk;
reg [3:0] D;
reg Din;
reg load;
wire Qout;
wire [3:0] Q_all;

PISO UUT(
.clk(clk),
.D(D),
.Din(Din),
.load(load),
.Qout(Qout),
.Q_all(Q_all)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    load = 0;
    D = 4'b0000;
    Din = 0;
    
    #10
    D = 4'b1010;
    load = 1;
    #10;
    load = 0;
    
    for(integer i = 0; i < 16; i = i + 1) begin
        Din = ~Din;
        #10;
    end
    
    #20
    $stop;
end
endmodule
