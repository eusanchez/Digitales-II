/* flip flop tipo D de n bits disparado por flanco
   creciente de clk con entrada de habilitacion enb.
   */
module FF
(
    input CLK,
    input EN,
    input D,
    output reg Q
);

/* en cada flanco creciente se actualiza la salida
   q con el valor en d si la enb esta habilitado.
   */
always @(posedge CLK) begin
    if (EN == 1'b1)
        Q <= D;
end

// NOTA: se tuvo que modificar este archivo para
// que los DFF sean de un bit, ya que YOSYS no
// parece trabajar con modulos que usen para-
// metros.
endmodule
