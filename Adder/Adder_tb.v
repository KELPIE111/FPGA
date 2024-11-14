`timescale 1ns / 1ps

module Adder_tb;
    reg [7:0] a, b;       
    wire [8:0] s;          
    
    
    Adder #(.w(8)) DUT (
        .a(a),
        .b(b),
        .s(s)
    );

    initial begin
        
        a = 8'b00000000;
        b = 8'b00000000;
        #10;
        $display("Test 1: a = %b, b = %b, s = %b", a, b, s);
        
       
        a = 8'b11111111;
        b = 8'b00000001;
        #10;
        $display("Test 2: a = %b, b = %b, s = %b", a, b, s);
        
        
        a = 8'b10000000;
        b = 8'b10000000;
        #10;
        $display("Test 3: a = %b, b = %b, s = %b", a, b, s);
        
        
        a = 8'b01010101;
        b = 8'b10101010;
        #10;
        $display("Test 4: a = %b, b = %b, s = %b", a, b, s);

        
        a = 8'b11111111;
        b = 8'b11111111;
        #10;
        $display("Test 5: a = %b, b = %b, s = %b", a, b, s);
        
        $finish;  
    end
endmodule
