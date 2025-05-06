module alu (
    input wire [31:0] in1,
    input wire [31:0] in2,
    input wire [4:0] aluControl,
    output reg zero,
    output reg [31:0] aluOutput
);

reg [63:0] mult_result;

always @(*) begin
    zero = (in1 == in2) ? 1'b1 : 1'b0;

    case (aluControl)
        4'b00000: aluOutput = in1 + in2; //add, addi
        4'b00001: aluOutput = in1 - in2; //sub
        4'b00010: aluOutput = in1 << in2[4:0]; //sll, slli
        4'b00011: aluOutput = in1 >> in2[4:0]; //srl, srli
        4'b00100: aluOutput = $signed(in1) >>> in2[4:0]; //sra, srai
        4'b00101: aluOutput = in1 & in2; //and, andi
        4'b00110: aluOutput = in1 | in2; //or, ori
        4'b00111: aluOutput = in1 ^ in2; //xor, xori
        4'b01000: aluOutput = ($signed(in1) < $signed(in2)) ? 1 : 0; //slt, slti
        4'b01001: aluOutput = (in1 < in2) ? 1 : 0; //sltu, sltiu
        4'b01010: begin //mul
            mult_result = &signed(in1) * &signed(in2);
            aluOutput = mult_result[31:0];
        end
        4'b01011: begin //mulh
            mult_result = &signed(in1) * &signed(in2);
            aluOutput = mult_result[63:32];
        end
        4'b01100: begin //mulhu
            mult_result = in1 * in2;
            aluOutput = mult_result[63:32];
        end
        4'b01101: begin //mulhsu
            mult_result = &signed(in1) * in2;
            aluOutput = mult_result[63:32];
        end
        4'b01110: aluOutput = &signed(in1) / &signed(in2); //div
        4'b01111: aluOutput = in1 / in2; //divu
        4'b10000: aluOutput = &signed(in1) % &signed(in2); //rem
        4'b10001: aluOutput = in1 % in2; //remu
    endcase
end

endmodule
