module program_counter (
    input wire clk,
    input wire reset,
    input wire pcWrite,
    input wire [31:0] next_pc,
    output reg [31:0] current_pc
);

always @(posedge clk or posedge reset)begin
    if(reset)begin
        current_pc <= 32'b0;
    end else if(pcWrite) begin
        current_pc <= next_pc;
    end

end

endmodule