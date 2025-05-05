module ifid_register (
    input wire clk,
    input wire reset,
    input wire flush,
    input wire if_id_write,
    input wire [7:0] addr_in,
    input wire [31:0] instruction_in,
    output reg [7:0] addr_out,
    output reg [31:0] instruction_out
);

always @(posedge clk) begin
    if (reset || flush) begin
        instruction_out <= 32'b0;
        addr_out <= 8'b0;
    end else if (if_id_write) begin
        instruction_out <= instruction_in;
        addr_out <= addr_in;
    end
end

endmodule
