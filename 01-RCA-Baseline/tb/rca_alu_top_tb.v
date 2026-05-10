`timescale 1ns/1ps

module rca_alu_top_tb;
    reg clk, rst_n, scan_en, si_top;
    reg [15:0] a, b;
    reg [2:0] opcode;
    wire [15:0] result;
    wire cout_final, so_top;

    rca_alu_top dut (
        .clk(clk),
        .rst_n(rst_n),
        .a_16bit(a),
        .b_16bit(b),
        .opcode(opcode),
        .scan_en(scan_en),
        .si_top(si_top),
        .so_top(so_top),
        .result_16bit(result),
        .cout_final(cout_final)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("rca_alu_16bit.vcd");
        $dumpvars(0, rca_alu_top_tb);

        clk = 0; rst_n = 0; scan_en = 0; si_top = 0;
        a = 0; b = 0; opcode = 0;
        #25 rst_n = 1; 

        @(negedge clk);
        a = 16'hFFFF; b = 16'h0001; opcode = 3'b000; 
        @(posedge clk);
        #20; 
        $display("EXTREME ADD: %d + %d = %d (Carry: %b)", a, b, result, cout_final);

        @(negedge clk);
        a = 16'h0000; b = 16'h0001; opcode = 3'b001; 
        @(posedge clk);
        #20;
        $display("EXTREME SUB: %d - %d = %d (Borrow: %b)", a, b, result, cout_final);

        @(negedge clk);
        a = 16'd32768; b = 16'd32768; opcode = 3'b000;
        @(posedge clk);
        #20;
        $display("MID-RANGE ADD: %d + %d = %d (Carry: %b)", a, b, result, cout_final);

        @(negedge clk);
        a = 16'hAAAA; b = 16'h5555; opcode = 3'b010;
        @(posedge clk);
        #20;
        $display("LOGIC AND: %h & %h = %h", a, b, result);

        @(negedge clk);
        a = 16'hF0F0; b = 16'h0F0F; opcode = 3'b011; 
        @(posedge clk);
        #20;
        $display("LOGIC OR: %h | %h = %h", a, b, result);

        @(negedge clk);
        scan_en = 1;
        #20;

        $display("Testing Complete. View Waves for detailed timing.");
        $finish;
    end
endmodule
