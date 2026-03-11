module instruction_memory(
    input [7:0] addr,
    output [7:0] instruction
);
    reg [7:0] memory[255:0];
    
    integer i;
    initial begin
        // Fill ALL memory with NOP (0) first
        for(i = 0; i < 256; i = i + 1)
            memory[i] = 8'h00;

        // Then define your actual instructions
        memory[0] = 8'b00000001;
        memory[1] = 8'b00000010;
        memory[2] = 8'b00000011;
        memory[3] = 8'b00000100;
        memory[4] = 8'b00000101;  // add more as needed
        memory[5] = 8'b00000110;
        memory[6] = 8'b00000111;
        memory[7] = 8'b00001000;
    end
    
    assign instruction = memory[addr];
endmodule
