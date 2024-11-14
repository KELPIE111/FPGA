`timescale 1ns / 1ps

module dff_async_reset_set_tb;
reg D;
reg clk;
reg rst;
reg set;
wire Q;

dff_async_reset_set DUT (
.D(D),
.CLK(clk),
.RESET(rst),
.SET(set),
.Q(Q)
);

always begin
    #5 clk = ~clk;
end

initial begin
    D = 0;
    clk = 0;
    rst = 0;
    
    $display("Async reset test");
    rst = 1; 
    #10;
    if(Q != 0)
        $display("ERROR: RESET IS NOT WORKING PROPERLY");
        
    rst = 0;
    #10
    
    $display("D test");
    D = 1;
    #10;
    if(Q != 1)
        $display("ERROR: D IS NOT WORKING PROPERLY");
    D = 0;
    #10;
    if(Q != 0)
        $display("ERROR: D IS NOT WORKING PROPERLY");
        
    $display("async set test");
    set = 1;
    #10;
    if(Q != 1)
        $display("ERROR: SET IS NOT WORKING");
    set = 0;
    #10;
    $display("Simulation is over");
    $finish;
    
end

endmodule
