module pipeline_registers(
    input        clk,
    input        reset,
    input        stall,
    input  [7:0] if_id_in,
    output reg [7:0] if_id_out,
    input  [7:0] id_ex_in,
    output reg [7:0] id_ex_out,
    input  [7:0] ex_mem_in,
    output reg [7:0] ex_mem_out,
    input  [7:0] mem_wb_in,
    output reg [7:0] mem_wb_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        if_id_out  <= 8'b0;
        id_ex_out  <= 8'b0;
        ex_mem_out <= 8'b0;
        mem_wb_out <= 8'b0;
    end
    else if (!stall) begin
        if_id_out  <= if_id_in;
        id_ex_out  <= 8'h00;    // insert NOP bubble on stall
        ex_mem_out <= ex_mem_in;
        mem_wb_out <= mem_wb_in;
    end
    else begin
        // Normal operation (no stall)
        if_id_out  <= if_id_in;
        id_ex_out  <= id_ex_in;
        ex_mem_out <= ex_mem_in;
        mem_wb_out <= mem_wb_in;
    end
end

endmodule
