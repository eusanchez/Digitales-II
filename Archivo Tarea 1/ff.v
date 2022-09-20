
/* flip flop tipo D de n bits disparado por flanco
   creciente de clk con entrada de habilitacion enb.
   */
module FF #(parameter BITS = 1)(
    input CLK,
    input EN,
    input [BITS-1:0] D,
    output reg [BITS-1:0] Q);

/* en cada flanco creciente se actualiza la salida
   q con el valor en d si la enb esta habilitado.
   */
always @(posedge CLK) begin
    if (EN == 1'b1) begin
        Q <= D;
    end else begin
        Q <= 0;
    end
end

endmodule