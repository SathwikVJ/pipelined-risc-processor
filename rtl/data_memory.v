module data_memory(
input clk,
input we,
input [7:0] addr,
input [7:0] write_data,
output [7:0] read_data
);

reg [7:0] memory[255:0];

assign read_data = memory[addr];

always @(posedge clk) begin
if(we)
memory[addr] <= write_data;
end

endmodule
