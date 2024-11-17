`timescale 1ns / 1ps

module sequence_detector_tb;


reg clk;
reg rst;
reg in_bit;
wire [1:0] out;


sequence_detector UUT (
    .clk(clk),
    .rst(rst),
    .in_bit(in_bit),
    .out(out)
);


always #5 clk = ~clk;


initial begin
    clk = 0;
    rst = 1;
    in_bit = 0;

    #10 rst = 0;

    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 1; 
    @(posedge clk) in_bit = 0;

    @(posedge clk) in_bit = 1; 
    
    @(posedge clk) in_bit = 0;
    @(posedge clk) in_bit = 0;
    @(posedge clk) in_bit = 0; 
    @(posedge clk) in_bit = 1;

    @(posedge clk) in_bit = 0;
    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 0;
    @(posedge clk) in_bit = 0;
    @(posedge clk) in_bit = 0; 
    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 1;
    @(posedge clk) in_bit = 1; 

    #50 $stop;
end

endmodule
