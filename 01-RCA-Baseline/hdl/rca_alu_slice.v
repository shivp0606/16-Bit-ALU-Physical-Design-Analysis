module rca_alu_slice (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] a, b,
    input  wire [2:0] opcode,
    input  wire       cin,      
    input  wire       scan_en,  
    input  wire       si,       
    output wire       so,       
    output reg  [3:0] result,
    output wire        cout      
);
    
    wire [4:0] full_sum;
    assign full_sum = a + b + cin;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result <= 4'b0;
        end else begin
            case (opcode)
                3'b000: result <= a + b + cin;
                3'b001: result <= a - b - cin;
                3'b010: result <= a & b;
                3'b011: result <= a | b;
                default: result <= 4'b0;
            endcase
        end
    end
    
    assign cout = (opcode == 3'b000) ? full_sum[4] :
                  (opcode == 3'b001) ? ((a < (b + cin))) : 1'b0;

    assign so = result[3]; 

endmodule
