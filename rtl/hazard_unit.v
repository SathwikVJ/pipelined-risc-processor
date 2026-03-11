module hazard_unit(
    input  [2:0] id_rs1,
    input  [2:0] id_rs2,
    input  [2:0] ex_rd,
    input        ex_regwrite,
    output reg   stall
);

always @(*) begin
    if (ex_regwrite && ((ex_rd == id_rs1) || (ex_rd == id_rs2)))
        stall = 1;
    else
        stall = 0;
end

endmodule
