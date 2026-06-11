`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 00:38:43
// Design Name: 
// Module Name: piso_tb
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


`timescale 1ns / 1ps

module piso_tb;

reg clk;
reg reset;
reg load;
reg [3:0] parallel_in;

wire serial_out;

piso uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    load = 0;
    parallel_in = 4'b0000;

    // Reset
    #10;
    reset = 0;

    // Load data 1011
    load = 1;
    parallel_in = 4'b1011;
    #10;

    // Start shifting
    load = 0;

    #50;

    $finish;
end

endmodule
