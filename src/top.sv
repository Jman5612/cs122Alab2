`include "src/adder.sv"
`include "src/decoder.sv"

module top(
input wire [3:0] val1,
input wire [3:0] val2,

output logic [7:0] seg7

);

wire[4:0] res;


adder adder (
    .val1(val1),
    .val2(val2),
    .res(res)

);

decoder decoder (
    .bcd(res[3:0]),
    .seg7(seg7[6:0])
);

assign seg7[7] = res[4];

endmodule