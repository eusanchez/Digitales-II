`include "contador.v"
`include "probador.v"

/* banco de pruebas para el
   registro de cuatro bits
   y el probador
   */
module tb;
    wire clk, enb, RCO;
    wire [1:0] modo;
    wire [3:0] D; 
    wire [3:0] Q;

    contador DUT(.CLK(clk), .ENB(enb),
                      .MODO(modo[1:0]), .D(D[3:0]), .Q(Q[3:0]),
                      .RCO(RCO));

    /* se instancia un probador
       */
    tester test(.CLK(clk), .ENB(enb),
                .MODO(modo[1:0]), .D(D[3:0]), .Q(Q[3:0]),
                .RCO(RCO));

/* para generar las ondas y
    y visualizar en gtkwave
    */
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars;
    end


    /* para mostrar (vvp) los valores
    de las entradas y salidas
    del registro en cada flanco
    activo de reloj
    */
    always @(posedge clk) begin
        $display(" %b     %b     %b      %b   %b", enb, modo, D, Q, RCO);
    end

endmodule
