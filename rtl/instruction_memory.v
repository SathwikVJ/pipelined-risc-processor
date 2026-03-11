module instruction_memory(
    input  [7:0] addr,
    output [7:0] instruction
);

reg [7:0] memory [255:0];

integer i;
initial begin
    // Fill all memory with NOP (0x00) to prevent XX
    for (i = 0; i < 256; i = i + 1)
        memory[i] = 8'h00;

    // Your actual instructions
    memory[0]  = 8'b00000001;
    memory[1]  = 8'b00000010;
    memory[2]  = 8'b00000011;
    memory[3]  = 8'b00000100;
    memory[4]  = 8'b00000101;
    memory[5]  = 8'b00000110;
    memory[6]  = 8'b00000111;
    memory[7]  = 8'b00001000;
    memory[8]  = 8'b00001001;
    memory[9]  = 8'b00001010;
    memory[10] = 8'b00001011;
    memory[11] = 8'b00001100;
    memory[12] = 8'b00001101;
    memory[13] = 8'b00001110;
    memory[14] = 8'b00001111;
    memory[15] = 8'b00010000;
end

assign instruction = memory[addr];

endmodule
