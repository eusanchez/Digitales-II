// Contador de 2 bits para la senal de MCD

module contador_2 (
input CLK,
input RESET,
output reg RESULT
);

always @(posedge CLK) begin
    if (~RESET || RESULT == 1'b1)
        RESULT <= 1'b0;
    else 
        RESULT <= 1'b1;


end
endmodule

module contador_32 (
    input CLK,
    input RESET,
    input ENB,
    output reg [4:0] RESULT
);

always @(posedge CLK) begin
    if (~RESET || RESULT == 5'd31)  //5'd31 = 5'b11111
        RESULT <= 1'b0;
    else 
        RESULT <= 1'b1;
    if (ENB && RESULT != 5'd31)
        RESULT <= RESULT + 1'b1;       
end


endmodule