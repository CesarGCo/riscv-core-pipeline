module registers (
    input wire clk,
    input wire reset,
    input wire regWrite,
    input wire [4:0] reg1,
    input wire [4:0] reg2,
    input wire [4:0] rd,
    input wire [31:0] writeData,
    output wire [31:0] readData1,
    output wire [31:0] readData2
);

    reg [31:0] regs [31:0];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            integer i;
            for (i = 0; i < 32; i = i + 1)
                regs[i] <= 32'b0;
        end else if (regWrite && rd != 0) begin
            regs[rd] <= writeData;  
        end
    end

    assign readData1 = regs[reg1];
    assign readData2 = regs[reg2];

endmodule
