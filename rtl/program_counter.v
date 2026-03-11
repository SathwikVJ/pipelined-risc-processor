module program_counter(
input clk,
input reset,
output reg [7:0] pc
);

always @(posedge clk or posedge reset) begin
if(reset)
pc <= 0;
else
pc <= pc + 1;
end

endmodule
