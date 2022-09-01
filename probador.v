`timescale 1ns/1ns // escala de tiempo

/*Probador del registro de cuatro
   bits*/
module tester (
    output reg CLK,
    output reg ENB,
    output reg [1:0] MODO,
    output reg [3:0] D,
    input [3:0] Q,
    input RCO
);

/*Creacion del reloj, en este apartado de codigo se inicializa el reloj
donde este cambia cada segundo de tiempo, siendo 0 en uno y 1 en otro
y asi hasta terminar de correr las pruebas*/

always begin
    CLK = 1'b0; #1;
    CLK = 1'b1; #1;
end

// Ejecucion de pruebas

initial begin
    $display("Prueba #1: Desplazamiento a la izquierda");
    $display("ENB    MODO   D       Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    D[3:0] = 4'b0000;

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    #1; #1;
    MODO = 2'b00; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj, en teoria el estado deberia ser 0001
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1; 
    #1; #1; //aqui ya muestra el llevo 


    $display("\nPrueba #2: Cuenta descendente");
    $display("ENB   MODO   D       Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b01;
    D[3:0] = 4'b1111;

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
//    #1; #1;
  //  MODO = 2'b01; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj, en teoria el estado deberia ser 0001
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;


    $finish;

end
endmodule