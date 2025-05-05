module mux (
    input wire [31:0] in1,
    input wire [31:0] in2,
    output wire [31:0] out,
    input wire ctrl
);

assign out = (ctrl) ? in1:in2;
  
endmodule