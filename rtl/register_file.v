module register_file(
input clk,
input we,
input [2:0] rs1,
input [2:0] rs2,
input [2:0] rd,
input [7:0] write_data,
output [7:0] read_data1,
output [7:0] read_data2
);

reg [7:0] registers[7:0];

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

always @(posedge clk) begin
if(we)
registers[rd] <= write_data;
end

endmodule
