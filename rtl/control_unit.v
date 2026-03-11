module control_unit(
input [2:0] opcode,
output reg [2:0] alu_op,
output reg reg_write
);

always @(*) begin

case(opcode)

3'b000: begin
alu_op = 3'b000;
reg_write = 1;
end

3'b001: begin
alu_op = 3'b001;
reg_write = 1;
end

3'b010: begin
alu_op = 3'b010;
reg_write = 1;
end

3'b011: begin
alu_op = 3'b011;
reg_write = 1;
end

default: begin
alu_op = 3'b000;
reg_write = 0;
end

endcase

end

endmodule
