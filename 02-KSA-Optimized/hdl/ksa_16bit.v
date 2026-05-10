module ksa_16bit (
    input [15:0] A, B,
    input cin,
    output [15:0] S,
    output cout
);

wire [15:0] g0, p0;

    assign g0 = A & B;
    assign p0 = A ^ B;

    wire [15:0] g1, p1;

    assign g1[0] = g0[0];
    assign p1[0] = p0[0];

    black_cell bc1_1  (g0[1],  p0[1],  g0[0],  p0[0],  g1[1],  p1[1]);
    black_cell bc1_2  (g0[2],  p0[2],  g0[1],  p0[1],  g1[2],  p1[2]);
    black_cell bc1_3  (g0[3],  p0[3],  g0[2],  p0[2],  g1[3],  p1[3]);
    black_cell bc1_4  (g0[4],  p0[4],  g0[3],  p0[3],  g1[4],  p1[4]);
    black_cell bc1_5  (g0[5],  p0[5],  g0[4],  p0[4],  g1[5],  p1[5]);
    black_cell bc1_6  (g0[6],  p0[6],  g0[5],  p0[5],  g1[6],  p1[6]);
    black_cell bc1_7  (g0[7],  p0[7],  g0[6],  p0[6],  g1[7],  p1[7]);
    black_cell bc1_8  (g0[8],  p0[8],  g0[7],  p0[7],  g1[8],  p1[8]);
    black_cell bc1_9  (g0[9],  p0[9],  g0[8],  p0[8],  g1[9],  p1[9]);
    black_cell bc1_10 (g0[10], p0[10], g0[9],  p0[9],  g1[10], p1[10]);
    black_cell bc1_11 (g0[11], p0[11], g0[10], p0[10], g1[11], p1[11]);
    black_cell bc1_12 (g0[12], p0[12], g0[11], p0[11], g1[12], p1[12]);
    black_cell bc1_13 (g0[13], p0[13], g0[12], p0[12], g1[13], p1[13]);
    black_cell bc1_14 (g0[14], p0[14], g0[13], p0[13], g1[14], p1[14]);
    black_cell bc1_15 (g0[15], p0[15], g0[14], p0[14], g1[15], p1[15]);
    
    
    wire [15:0] g2, p2;
    
    assign g2[0] = g1[0];
    assign p2[0] = p1[0];
    assign g2[1] = g1[1];
    assign p2[1] = p1[1];

    black_cell bc2_2  (g1[2],  p1[2],  g1[0],  p1[0],  g2[2],  p2[2]);
    black_cell bc2_3  (g1[3],  p1[3],  g1[1],  p1[1],  g2[3],  p2[3]);
    black_cell bc2_4  (g1[4],  p1[4],  g1[2],  p1[2],  g2[4],  p2[4]);
    black_cell bc2_5  (g1[5],  p1[5],  g1[3],  p1[3],  g2[5],  p2[5]);
    black_cell bc2_6  (g1[6],  p1[6],  g1[4],  p1[4],  g2[6],  p2[6]);
    black_cell bc2_7  (g1[7],  p1[7],  g1[5],  p1[5],  g2[7],  p2[7]);
    black_cell bc2_8  (g1[8],  p1[8],  g1[6],  p1[6],  g2[8],  p2[8]);
    black_cell bc2_9  (g1[9],  p1[9],  g1[7],  p1[7],  g2[9],  p2[9]);
    black_cell bc2_10 (g1[10], p1[10], g1[8],  p1[8],  g2[10], p2[10]);
    black_cell bc2_11 (g1[11], p1[11], g1[9],  p1[9],  g2[11], p2[11]);
    black_cell bc2_12 (g1[12], p1[12], g1[10], p1[10], g2[12], p2[12]);
    black_cell bc2_13 (g1[13], p1[13], g1[11], p1[11], g2[13], p2[13]);
    black_cell bc2_14 (g1[14], p1[14], g1[12], p1[12], g2[14], p2[14]);
    black_cell bc2_15 (g1[15], p1[15], g1[13], p1[13], g2[15], p2[15]);
    
    
    wire [15:0] g3, p3;

    assign g3[0] = g2[0];
    assign p3[0] = p2[0];
    assign g3[1] = g2[1];
    assign p3[1] = p2[1];
    assign g3[2] = g2[2];
    assign p3[2] = p2[2];
    assign g3[3] = g2[3];
    assign p3[3] = p2[3];

    black_cell bc3_4  (g2[4],  p2[4],  g2[0],  p2[0],  g3[4],  p3[4]);
    black_cell bc3_5  (g2[5],  p2[5],  g2[1],  p2[1],  g3[5],  p3[5]);
    black_cell bc3_6  (g2[6],  p2[6],  g2[2],  p2[2],  g3[6],  p3[6]);
    black_cell bc3_7  (g2[7],  p2[7],  g2[3],  p2[3],  g3[7],  p3[7]);
    black_cell bc3_8  (g2[8],  p2[8],  g2[4],  p2[4],  g3[8],  p3[8]);
    black_cell bc3_9  (g2[9],  p2[9],  g2[5],  p2[5],  g3[9],  p3[9]);
    black_cell bc3_10 (g2[10], p2[10], g2[6],  p2[6],  g3[10], p3[10]);
    black_cell bc3_11 (g2[11], p2[11], g2[7],  p2[7],  g3[11], p3[11]);
    black_cell bc3_12 (g2[12], p2[12], g2[8],  p2[8],  g3[12], p3[12]);
    black_cell bc3_13 (g2[13], p2[13], g2[9],  p2[9],  g3[13], p3[13]);
    black_cell bc3_14 (g2[14], p2[14], g2[10], p2[10], g3[14], p3[14]);
    black_cell bc3_15 (g2[15], p2[15], g2[11], p2[11], g3[15], p3[15]);
    
    
    wire [15:0] g4, p4;

    assign g4[0] = g3[0]; assign p4[0] = p3[0];
    assign g4[1] = g3[1]; assign p4[1] = p3[1];
    assign g4[2] = g3[2]; assign p4[2] = p3[2];
    assign g4[3] = g3[3]; assign p4[3] = p3[3];
    assign g4[4] = g3[4]; assign p4[4] = p3[4];
    assign g4[5] = g3[5]; assign p4[5] = p3[5];
    assign g4[6] = g3[6]; assign p4[6] = p3[6];
    assign g4[7] = g3[7]; assign p4[7] = p3[7];
    
    black_cell bc4_8  (g3[8],  p3[8],  g3[0],  p3[0],  g4[8],  p4[8]);
    black_cell bc4_9  (g3[9],  p3[9],  g3[1],  p3[1],  g4[9],  p4[9]);
    black_cell bc4_10 (g3[10], p3[10], g3[2],  p3[2],  g4[10], p4[10]);
    black_cell bc4_11 (g3[11], p3[11], g3[3],  p3[3],  g4[11], p4[11]);
    black_cell bc4_12 (g3[12], p3[12], g3[4],  p3[4],  g4[12], p4[12]);
    black_cell bc4_13 (g3[13], p3[13], g3[5],  p3[5],  g4[13], p4[13]);
    black_cell bc4_14 (g3[14], p3[14], g3[6],  p3[6],  g4[14], p4[14]);
    black_cell bc4_15 (g3[15], p3[15], g3[7],  p3[7],  g4[15], p4[15]);
    
    
    assign S[0] = p0[0] ^ cin;
    assign S[15:1] = p0[15:1] ^ g4[14:0];
    assign cout = g4[15];

endmodule
