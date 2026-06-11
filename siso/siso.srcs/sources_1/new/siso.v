`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 00:31:24
// Design Name: 
// Module Name: siso
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


module siso(
    input clk,
    input reset,
    input serial_in,
    output serial_out
);

reg [3:0] shift_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
        shift_reg <= 4'b0000;
    else
        shift_reg <= {shift_reg[2:0], serial_in};
end

assign serial_out = shift_reg[3];

endmodule
