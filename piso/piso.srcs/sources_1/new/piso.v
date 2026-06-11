`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 00:38:20
// Design Name: 
// Module Name: piso
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


module piso(
    input clk,
    input reset,
    input load,
    input [3:0] parallel_in,
    output reg serial_out
);

reg [3:0] shift_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
        shift_reg <= 4'b0000;
    else if(load)
        shift_reg <= parallel_in;
    else
        shift_reg <= {shift_reg[2:0], 1'b0};
end

always @(*)
    serial_out = shift_reg[3];

endmodule
