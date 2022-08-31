timescale 1ns/1ns // escala de tiempo

* Probador del registro de cuatro
   bits
   */
module tester (
    output reg CLK,
    output reg ENB,
    output reg DIR,
    output reg S_IN,
    output reg [1:0] MODO,
    output reg [3:0] D,
    input [3:0] Q,
    input S_OUT
);