`timescale 1ns / 1ps

module dff_async_reset_set(D, CLK, RESET, SET, Q);
    input D, CLK, RESET, SET;
    output Q;
    reg Q;
    
    always @ (posedge CLK or RESET or SET)
    
    begin
        if(RESET == 1'b1)
            Q <= 1'b0;
        else if (SET == 1'b1)
            Q <= 1'b1;
        else
            Q <= D;
     end
endmodule
