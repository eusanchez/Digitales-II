`include "contador_cmos_nodelay.v"
`include "probador.v"
`include "contador_RTLIL.v"
`include "cmos_cell.v"


// Banco de pruebas para el registro de cuatro bits y el probador

module tb16_yosys;
    wire clk, enb, RCO, RCO162, RCO163, RCO164;
    wire [1:0] modo;
    wire [15:0] D; 
    wire [15:0] Q;


    contador16 DUT16(/*AUTOINST*/
        .CLK(clk), 
        .ENB(enb),
        .MODO(modo[1:0]), 
        .entrada(D[15:0]), 
        .salida(Q[15:0]),
        .RCO(RCO), 
        .RCO162(RCO162), 
        .RCO163(RCO163),
        .RCO164(RCO164));

    tester16 test16(/*AUTOINST*/
        .CLK(clk), .ENB(enb),
        .MODO(modo[1:0]),
        .entrada(D[15:0]), 
        .salida(Q[15:0]), 
        .RCO(RCO), 
        .RCO162(RCO162), 
        .RCO163(RCO163), 
        .RCO164(RCO164));

/* para generar las ondas y visualizar en gtkwave*/
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars;
    end

    always @(posedge clk) begin
        $display("enb=%b     modo=%b     D16=%b      Q16=%b   RCO=%b", enb, modo, D, Q, RCO);
    end


endmodule

module tb16_cmos;
    wire clk, enb, RCO, RCO162, RCO163, RCO164;
    wire [1:0] modo;
    wire [15:0] D; 
    wire [15:0] Q;


    contador16 DUT16(/*AUTOINST*/
        .CLK(clk), 
        .ENB(enb),
        .MODO(modo[1:0]), 
        .entrada(D[15:0]), 
        .salida(Q[15:0]),
        .RCO(RCO), 
        .RCO162(RCO162), 
        .RCO163(RCO163),
        .RCO164(RCO164));

    tester16 test16(/*AUTOINST*/
        .CLK(clk), .ENB(enb),
        .MODO(modo[1:0]),
        .entrada(D[15:0]), 
        .salida(Q[15:0]), 
        .RCO(RCO), 
        .RCO162(RCO162), 
        .RCO163(RCO163), 
        .RCO164(RCO164));

/* para generar las ondas y visualizar en gtkwave*/
    /*initial begin
        $dumpfile("testbench.vcd");
        $dumpvars;
    end*/

    always @(posedge clk) begin
        $display("enb=%b     modo=%b     D16=%b      Q16=%b   RCO=%b", enb, modo, D, Q, RCO);
    end


endmodule
