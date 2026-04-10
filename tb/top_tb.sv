`include "src/top.sv"
`timescale 1ns/1ps         // Set tick to 1ns. Set sim resolution to 1ps.

/**
 * Note:
 *  The TB below is only an example of a testbench written in SV.
 *  Adapt this for your lab assignments as you see fit.
 *  An example clk signal has been added to show what a signal decl and usage looks like.
 *     You are welcome to delete the clk signal if it's not needed.
 *     For instance, purely combinational circuits do not need clks.
 *     So for labs without sequential elements, you can remove them.
 */

module top_tb;

/** declare tb signals below */
logic [3:0] val1_tb;
logic [3:0] val2_tb;
logic [7:0] seg7_tb; 


/** declare module(s) below */
top dut                    // declare an inst of top called "dut" (device under test)
(
    /** hook up tb signals to dut signals */
    .val1(val1_tb),
    .val2(val2_tb),
    .seg7(seg7_tb)
);



initial begin
    $dumpfile("build/top.vcd"); // intermediate file for waveform generation
    $dumpvars(0, top_tb);       // capture all signals under top_tb
end

initial begin
    /** testbench logic goes below */
    val1_tb = 4'd3; val2_tb = 4'd4; #5 // 7
    val1_tb = 4'd0; val2_tb = 4'd0; #5 // 0
    val1_tb = 4'd5; val2_tb = 4'd5; #5 // 10 "A"
    val1_tb = 4'd10; val2_tb = 4'd5; #5 // 15 "F"


    val1_tb = 4'd8; val2_tb = 4'd8; #5 // 16
    val1_tb = 4'd15; val2_tb = 4'd10; #5 // 25



    $finish;            // end simulation, otherwise it runs indefinitely
end

endmodule
