`include "contador.v"
`include "probador.v"
//`include "contador16.v"

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
                .MODO(modo[1:0]), .D(D[3:0]), .Q(Q[3:0]), .RCO(RCO));

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
    /*always @(posedge clk) begin
        $display(" %b     %b     %b      %b   %b", enb, modo, D, Q, RCO);
    end*/

endmodule


module tb16;
    wire clk, enb, RCO, RCO162, RCO163, RCO164;
    wire [1:0] modo;
    wire [15:0] D; 
    wire [15:0] Q;


    contador16 DUT16 (.CLK(clk), .ENB(enb),
                      .MODO(modo[1:0]), .entrada(D[15:0]), .salida(Q[15:0]),
                      .RCO(RCO), .RCO162(RCO162), .RCO163(RCO163), .RCO164(RCO164));

    /* se instancia un probador
       */
    tester16 test16(.CLK(clk), .ENB(enb),
                .MODO(modo[1:0]),.entrada(D[15:0]), .salida(Q[15:0]), 
                .RCO(RCO), .RCO162(RCO162), .RCO163(RCO163), .RCO164(RCO164));

/* para generar las ondas y
    y visualizar en gtkwave
    */
    /*initial begin
        $dumpfile("testbench.vcd");
        $dumpvars;
    end*/

    /* para mostrar (vvp) los valores
    de las entradas y salidas
    del registro en cada flanco
    activo de reloj
    */
    always @(posedge clk) begin
        $display("enb=%b     modo=%b     D16=%b      Q16=%b   RCO=%b", enb, modo, D, Q, RCO162);
    end

endmodule