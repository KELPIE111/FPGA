`timescale 1ns / 1ps

module Full_Adder(
    input a, b, cin,
    output s, cout
    );
    
    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule
