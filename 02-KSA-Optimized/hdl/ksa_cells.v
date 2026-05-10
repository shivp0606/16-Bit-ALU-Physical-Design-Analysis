module black_cell (
    input g_hi, p_hi, g_lo, p_lo,
    output g_out, p_out
);
    assign g_out = g_hi | (p_hi & g_lo); 
    assign p_out = p_hi & p_lo;         
endmodule


module gray_cell (
    input g_hi, p_hi, g_lo,
    output g_out
);
    assign g_out = g_hi | (p_hi & g_lo);
endmodule
