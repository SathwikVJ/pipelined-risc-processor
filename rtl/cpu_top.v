module cpu_top(
input clk,
input reset
);

wire [7:0] pc;
wire [7:0] instruction;

wire [7:0] reg_data1;
wire [7:0] reg_data2;
wire [7:0] alu_result;

wire [2:0] alu_op;
wire reg_write;

program_counter pc_unit(
.clk(clk),
.reset(reset),
.pc(pc)
);

instruction_memory imem(
.addr(pc),
.instruction(instruction)
);

control_unit cu(
.opcode(instruction[7:5]),
.alu_op(alu_op),
.reg_write(reg_write)
);

register_file rf(
.clk(clk),
.we(reg_write),
.rs1(instruction[4:2]),
.rs2(instruction[4:2]),
.rd(instruction[1:0]),
.write_data(alu_result),
.read_data1(reg_data1),
.read_data2(reg_data2)
);

alu alu_unit(
.a(reg_data1),
.b(reg_data2),
.alu_op(alu_op),
.result(alu_result)
);

endmodule
