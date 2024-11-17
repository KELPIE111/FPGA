`timescale 1ns / 1ps

module sequence_detector(
    input clk,
    input in_bit,
    input rst,
    output reg [1:0] out
    );
    
typedef enum reg [2:0] {
IDLE,
S1_1,
S2_1,
S1_0,
S2_0
} state_t;

state_t next_state, state;

always @ (posedge clk or posedge rst) begin
    if (rst)
        state <= IDLE;
    else
        state <= next_state;
end

always @(*) begin 
    next_state = state;
    out = 2'b00;
    
    case (state)
        IDLE: begin
            if (in_bit)
                next_state <= S1_1;
            else
                next_state <= S1_0;
        end
        
        S1_1: begin
            if (in_bit)
                next_state <= S2_1;
            else
                next_state <= S1_0;
        end
        
        S2_1: begin
            if (in_bit) begin
                out <= 2'b01;
                next_state <= S2_1;
            end else
                next_state <= S1_0;
        end
        
        S1_0: begin 
            if (~in_bit) 
                next_state <= S2_0;
            else
                next_state <= S1_1;
            end
            
        S2_0: begin
            if (~in_bit) begin
                out <= 2'b11;
                next_state <= S2_0;
            end else
                next_state <= S1_1;
        end
        
        default:
            next_state <= IDLE;
     endcase
end

endmodule
