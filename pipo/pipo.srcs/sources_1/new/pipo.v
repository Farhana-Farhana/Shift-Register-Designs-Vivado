`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 00:42:12
// Design Name: 
// Module Name: pipo
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


module pipo(
    input clk,
    input reset,
    input [3:0] parallel_in,
    output reg [3:0] parallel_out
);

always @(posedge clk or posedge reset)
begin
    if(reset)
        parallel_out <= 4'b0000;
    else
        parallel_out <= parallel_in;
end

endmodule
