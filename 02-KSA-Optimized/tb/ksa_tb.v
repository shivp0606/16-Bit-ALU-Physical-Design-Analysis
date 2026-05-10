`timescale 1ns / 1ps

module ksa_tb;

    reg [15:0] A_tb, B_tb;
    reg cin_tb;

    wire [15:0] S_tb;
    wire cout_tb;

    ksa_16bit uut (
        .A(A_tb), 
        .B(B_tb), 
        .cin(cin_tb), 
        .S(S_tb), 
        .cout(cout_tb)
    );

    initial begin
        $dumpfile("ksa_16bit.vcd"); 
        $dumpvars(0, ksa_tb);          
        
        
        A_tb = 16'd5; B_tb = 16'd10; cin_tb = 0;
        #10; 
        $display("Test 1: %d + %d = %d (Carry: %b)", A_tb, B_tb, S_tb, cout_tb);

        A_tb = 16'hFFFF; B_tb = 16'h0001; cin_tb = 0;
        #10;
        $display("Test 2: %h + %h = %h (Carry: %b)", A_tb, B_tb, S_tb, cout_tb);
        
        A_tb = 16'd1234; B_tb = 16'd5678; cin_tb = 1;
        #10;
        $display("Test 3 (with cin): %d + %d + 1 = %d", A_tb, B_tb, S_tb);

        $finish; 
    end

endmodule
