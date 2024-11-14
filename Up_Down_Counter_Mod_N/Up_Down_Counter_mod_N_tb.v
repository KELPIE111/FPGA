`timescale 1ns / 1ps

module counter_tb;

reg clk;
reg rst;
reg up;
wire [3:0] count;

counter #(.N(10)) DUT (
.clk(clk),
.rst(rst),
.up(up),
.count(count)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    rst = 0;
    up = 0;
    
    rst = 1;
    #20;
    rst = 0;
    
    up = 1;
    #200;
    
    up = 0;
    #200;
    
    $stop;
end
endmodule
