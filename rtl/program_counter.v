module program_counter(
    input        clk,
    input        reset,
    input        stall,
    output reg [7:0] pc
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 8'b0;
    else if (!stall)
        pc <= pc + 1;
end

endmodule
