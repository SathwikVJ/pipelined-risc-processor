`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg reset;

cpu_top uut(
.clk(clk),
.reset(reset)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,cpu_tb);

clk = 0;
reset = 1;

#10 reset = 0;

#200 $finish;

end

always #5 clk = ~clk;

endmodule
