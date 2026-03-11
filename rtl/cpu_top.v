module cpu_top(
    input clk,
    input reset
);

wire [7:0] pc;
wire [7:0] instruction;

wire [7:0] if_id_out;
wire [7:0] id_ex_out;
wire [7:0] ex_mem_out;
wire [7:0] mem_wb_out;

wire stall;
wire [7:0] result;

/* Program Counter */
program_counter PC(
    .clk(clk),
    .reset(reset),
    .pc(pc)
);

/* Instruction Memory */
instruction_memory IM(
    .addr(pc),
    .instruction(instruction)
);

/* Pipeline Registers */
pipeline_registers PIPE(
    .clk(clk),
    .reset(reset),

    .if_id_in(instruction),
    .if_id_out(if_id_out),

    .id_ex_in(if_id_out),
    .id_ex_out(id_ex_out),

    .ex_mem_in(id_ex_out),
    .ex_mem_out(ex_mem_out),

    .mem_wb_in(ex_mem_out),
    .mem_wb_out(mem_wb_out)
);

/* ALU (example stage result) */
alu ALU(
    .a(mem_wb_out),
    .b(8'b00000001),
    .alu_control(2'b00),
    .result(result)
);

/* Hazard Unit */
hazard_unit HZ(
    .id_ex(id_ex_out),
    .if_id(if_id_out),
    .stall(stall)
);

endmodule
