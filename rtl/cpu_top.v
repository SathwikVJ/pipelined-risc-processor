module cpu_top(
    input clk,
    input reset
);

// ─── Wires ───────────────────────────────────────────
wire [7:0] pc;
wire [7:0] instruction;
wire [7:0] if_id_out;
wire [7:0] id_ex_out;
wire [7:0] ex_mem_out;
wire [7:0] mem_wb_out;
wire [7:0] result;

// Hazard unit signals
wire [2:0] id_rs1;
wire [2:0] id_rs2;
wire [2:0] ex_rd;
wire       ex_regwrite;
wire       stall;

// ─── Decode fields from pipeline registers ───────────
assign id_rs1      = if_id_out[5:3];
assign id_rs2      = if_id_out[2:0];
assign ex_rd       = id_ex_out[7:5];
assign ex_regwrite = |id_ex_out;

// ─── Program Counter ─────────────────────────────────
program_counter PC(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .pc(pc)
);

// ─── Instruction Memory ───────────────────────────────
instruction_memory IM(
    .addr(pc),
    .instruction(instruction)
);

// ─── Pipeline Registers ───────────────────────────────
pipeline_registers PIPE(
    .clk(clk),
    .reset(reset),
    .stall(stall),
    .if_id_in(instruction),
    .if_id_out(if_id_out),
    .id_ex_in(if_id_out),
    .id_ex_out(id_ex_out),
    .ex_mem_in(id_ex_out),
    .ex_mem_out(ex_mem_out),
    .mem_wb_in(ex_mem_out),
    .mem_wb_out(mem_wb_out)
);

// ─── ALU ──────────────────────────────────────────────
alu ALU(
    .a(id_ex_out),
    .b(8'b00000001),
    .alu_control(2'b00),
    .result(result)
);

// ─── Hazard Unit ──────────────────────────────────────
hazard_unit HZ(
    .id_rs1(id_rs1),
    .id_rs2(id_rs2),
    .ex_rd(ex_rd),
    .ex_regwrite(ex_regwrite),
    .stall(stall)
);

endmodule
