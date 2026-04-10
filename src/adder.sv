module adder(
input wire [3:0] val1,
input wire [3:0] val2,
output logic [4:0] res

);

always_comb begin
res = val1 + val2;
end

endmodule
