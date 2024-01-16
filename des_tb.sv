`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2024 17:11:10
// Design Name: 
// Module Name: des_tb
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


module des_tb(

    );
    reg clk,areset,j,k;
    wire out;
    des dut(.clk(clk),.areset(areset),.j(j),.k(k),.out(out));
    always #5 clk=~clk;
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%t areset=%b j=%b k=%b out=%b",$time,areset,j,k,out);
    clk<=0;
    areset<=0;
    j<=0;
    k<=0;
    #4 j<=1;
    #10 k<=1; j<=0;
    #10 areset<=1;
    #10 j<=1; k<=0;
    #10 $finish;
    end
endmodule
