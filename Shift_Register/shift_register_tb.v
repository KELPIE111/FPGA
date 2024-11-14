`timescale 1ns / 1ps

module shift_register_tb;

reg clk;
reg [1:0] S;
reg [7:0] D;
wire [7:0] Q;

shift_register UUT (
.clk(clk),
.S(S),
.D(D),
.Q(Q)
);

always #5 clk = ~clk;

initial begin
   
   clk = 0;
   S = 2'b00;
   D = 8'b00000000;
   
   #10
   D = 8'b10101010;
   S = 2'b10;
   #10
   S = 2'b00;
   
   #10
   S = 2'b01;
   #20
   S = 2'b00;
   
   #20
   
   $stop; 
end
endmodule
