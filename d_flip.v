
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 07:01:56 PM
// Design Name: 
// Module Name: d_flop
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

`timescale 1ns/1ps
module d_flip(
  input clk,
  input reset,
  input [3:0] d,
  output [3:0]q
    );
    reg [3:0]q_r,q_next;
 always@(posedge clk) begin
   if(reset)
    q_r<=4'b0000;
    else
    q_r<=q_next;
 end
 always@(*)begin
 q_next=d;
 end
 assign q=q_r;
endmodule
