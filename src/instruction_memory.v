module instruction_memory (
    input wire [7:0] addr, //Max instructions = 256
    output wire [31:0] instruction
);

reg [31:0] inst_memory [255:0];

assign instruction = inst_memory[addr];

endmodule