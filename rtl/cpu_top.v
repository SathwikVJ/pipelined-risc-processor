module cpu_top(
input clk,
input reset
);

// Program Counter
wire [7:0] pc;

// Instruction
wire [7:0] instruction;

// Register outputs
wire [7:0] reg_data1;
wire [7:0] reg_data2;

// ALU output
wire [7:0] alu_result;

// Control signals
wire [2:0] alu_op;
wire reg_write;

// Pipeline wires
wire [7:0] if_id;
wire [7:0] id_ex;
wire [7:0] ex_mem;
wire [7:0] mem_wb;

// Hazard signal
wire stall;


// Program Counter
program_counter pc_unit(
.clk(clk),
.reset(reset),
.pc(pc)
);


// Instruction Memory
instruction_memory imem(
.addr(pc),
.instruction(instruction)
);


// Pipeline Registers
pipeline_registers pipe_regs(
.clk(clk),
.reset(reset),

.if_id_in(instruction),
.if_id_out(if_id),

.id_ex_in(reg_data1),
.id_ex_out(id_ex),

.ex_mem_in(alu_result),
.ex_mem_out(ex_mem),

.mem_wb_in(ex_mem),
.mem_wb_out(mem_wb)
);


// Control Unit
control_unit cu(
.opcode(if_id[7:5]),
.alu_op(alu_op),
.reg_write(reg_write)
);


// Register File
register_file rf(
.clk(clk),
.we(reg_write),
.rs1(if_id[4:2]),
.rs2(if_id[4:2]),
.rd(if_id[1:0]),
.write_data(mem_wb),
.read_data1(reg_data1),
.read_data2(reg_data2)
);


// ALU
alu alu_unit(
.a(id_ex),
.b(reg_data2),
.alu_op(alu_op),
.result(alu_result)
);


// Hazard Detection
hazard_unit hz(
.id_rs1(if_id[4:2]),
.id_rs2(if_id[4:2]),
.ex_rd(if_id[1:0]),
.ex_regwrite(reg_write),
.stall(stall)
);

endmodule
