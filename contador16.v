`include "contador.v"

module contador16 (
    input CLK,
    input ENB,
    input [1:0] MODO,
    input [15:0] entrada,
    output [15:0] salida,
    output RCO);

wire RCO0, RCO1, RCO2;

contador contador1(
    .CLK    (CLK),
    .ENB    (ENB), 
    .MODO   (MODO[1:0]), 
    .D      (entrada[3:0]), 
    .Q      (salida[3:0]),
    .RCO    (RCO0));

contador contador2(
    .CLK    (RCO0),
    .ENB    (ENB), 
    .MODO   (MODO[1:0]), 
    .D      (entrada[7:4]), 
    .Q      (salida[7:4]),
    .RCO    (RCO1));

contador contador3(
    .CLK    (RCO1),
    .ENB    (ENB), 
    .MODO   (MODO[1:0]), 
    .D      (entrada[11:8]), 
    .Q      (salida[11:8]),
    .RCO    (RCO2));

contador contador4(
    .CLK    (RCO3),
    .ENB    (ENB), 
    .MODO   (MODO[1:0]), 
    .D      (entrada[15:12]), 
    .Q      (salida[15:12]),
    .RCO    (RCO));

endmodule