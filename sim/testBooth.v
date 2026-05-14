`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2026 03:42:11 PM
// Design Name: 
// Module Name: testBooth
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


module testBooth();
    reg  [15:0] dIn;
    reg  clk, start;
    wire done;
    wire [31:0] product;

    TOP DUT (.product(product), .done(done), .dIn(dIn), .clk(clk), .start(start));

    always #5 clk = ~clk;

    initial begin
        clk = 0; start = 0; dIn = 0;
        #100;

        // Test 1: 10 * 5 = 50
        $display("Multiplying 10 with 5 ---");
        dIn = 16'd10;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
        @(negedge clk); dIn = 16'd5;
        wait(done);
        $display("Result: %0d | Expected: 50", $signed(product));

        #100;

        // Test 2: -7 * 3 = -21
        $display("Multiplying -7 with 3 ---");
        dIn = -16'd7;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
        @(negedge clk); dIn = 16'd3;
        wait(done);
        $display("Result: %0d | Expected: -21", $signed(product));

        #100;

        // Test 3: -8 * -8 = 64
        $display("Multiplying -8 with -8 ---");
        dIn = -16'd8;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
        @(negedge clk); dIn = -16'd8;
        wait(done);
        $display("Result: %0d | Expected: 64", $signed(product));

        #100;

        // Test 4: 100 * 200 = 20000
        $display("Multiplying 100 with 200 ---");
        dIn = 16'd100;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
        @(negedge clk); dIn = 16'd200;
        wait(done);
        $display("Result: %0d | Expected: 20000", $signed(product));

        #100;
        $display("All tests completed.");
        $finish;
    end
endmodule
