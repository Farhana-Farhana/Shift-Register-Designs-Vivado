`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 00:42:29
// Design Name: 
// Module Name: pipo_tb
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

module pipo_tb;

reg clk;
reg reset;
reg [3:0] parallel_in;

wire [3:0] parallel_out;

pipo uut(
    .clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    clk = 0;
    reset = 1;
    parallel_in = 4'b0000;

    // Reset
    #10;
    reset = 0;

    // Test Case 1
    parallel_in = 4'b1011;
    #10;

    // Test Case 2
    parallel_in = 4'b1100;
    #10;

    // Test Case 3
    parallel_in = 4'b0110;
    #10;

    // Test Case 4
    parallel_in = 4'b1111;
    #10;

    $finish;

end

// Monitor values in Tcl Console
initial
begin
    $monitor("Time=%0t parallel_in=%b parallel_out=%b",
              $time, parallel_in, parallel_out);
end

endmodule
