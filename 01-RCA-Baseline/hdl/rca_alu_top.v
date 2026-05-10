module rca_alu_top (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] a_16bit, b_16bit, 
    input  wire [2:0]  opcode,
    input  wire        scan_en,
    input  wire        si_top,
    output wire        so_top,
    output wire [15:0] result_16bit,
    output wire        cout_final
);

    wire c0, c1, c2; 
    wire s0, s1, s2; 

    rca_alu_slice slice0 (
        .clk(clk), .rst_n(rst_n),
        .a(a_16bit[3:0]), .b(b_16bit[3:0]),
        .opcode(opcode), .cin(1'b0),        
        .scan_en(scan_en), .si(si_top), .so(s0),
        .result(result_16bit[3:0]), .cout(c0)
    );

    rca_alu_slice slice1 (
        .clk(clk), .rst_n(rst_n),
        .a(a_16bit[7:4]), .b(b_16bit[7:4]),
        .opcode(opcode), .cin(c0),          
        .scan_en(scan_en), .si(s0), .so(s1), 
        .result(result_16bit[7:4]), .cout(c1)
    );

    rca_alu_slice slice2 (
        .clk(clk), .rst_n(rst_n),
        .a(a_16bit[11:8]), .b(b_16bit[11:8]),
        .opcode(opcode), .cin(c1),          
        .scan_en(scan_en), .si(s1), .so(s2), 
        .result(result_16bit[11:8]), .cout(c2)
    );

    rca_alu_slice slice3 (
        .clk(clk), .rst_n(rst_n),
        .a(a_16bit[15:12]), .b(b_16bit[15:12]),
        .opcode(opcode), .cin(c2),          
        .scan_en(scan_en), .si(s2), .so(so_top), 
        .result(result_16bit[15:12]), .cout(cout_final)
    );

endmodule
