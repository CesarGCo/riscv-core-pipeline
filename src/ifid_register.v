module ifid_register (
    input wire clk,
    input wire [7:0] addr_in,
    input wire [31:0] instruction_in,
    output reg [7:0] addr_out,
    output reg [31:0] instruction_out
);

always @(posedge clk)begin
    addr_out <= addr_in;
    instruction_out <= instruction_in;
end

endmodule