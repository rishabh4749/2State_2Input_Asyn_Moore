`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 17:10:47
// Design Name: 
// Module Name: des
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module des(
    input clk,
    input areset,   
    input j,
    input k,
    output out); 

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case(state) 
        
        OFF:begin
        if(j)
        next_state<=ON;
        else
        next_state<=OFF;
        end
        
        ON:begin
        if(k)
        next_state<=OFF;
        else
        next_state<=ON;
        end
        
        default:begin
        next_state<=OFF;
        end
        endcase
        
    end

    always @(posedge clk, posedge areset) begin
        if(areset) 
        state<=OFF;
        else
        state<=next_state;
    end

    assign out = (state==0)?0:1;

endmodule

