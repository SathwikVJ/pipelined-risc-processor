module instruction_memory(
input [7:0] addr,
output [7:0] instruction
);

reg [7:0] memory[255:0];

initial begin
memory[0] = 8'b00000001;
memory[1] = 8'b00000010;
memory[2] = 8'b00000011;
memory[3] = 8'b00000100;
end

assign instruction = memory[addr];

endmodule
