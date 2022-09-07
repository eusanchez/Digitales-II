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

/*initial begin
    $display("Prueba #1: Cuenta ascendente");
    $display("ENB    MODO   D        Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    D[3:0] = 4'b0000;

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    //#1; #1;
    //MODO = 2'b00; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj
    /*Para este caso es muy importante que tomemos en cuenta que el RCO no sera
    igual a 1, hasta que a 1111 no se le sume 1, en este caso ya tomaria el llevo
    y RCO = 1 */
    /*#1; #1;
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
    $display("ENB   MODO   D        Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    D[3:0] = 4'b1111; //Inicio en 1111

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    //#1; #1;
    //MODO = 2'b01; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj
    /*#1; #1;
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

    $display("\nPrueba #3: Cuenta de tres en tres hacia abajo");
    $display("ENB   MODO   D        Q       RCO");

    ENB = 1'b1;
    MODO = 2'b01;
    D[3:0] = 4'b0000;

    #1;#1;
    MODO = 2'b10;

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

    $display("\nPrueba #5: Carga en paralelo");
    $display("ENB   MODO   D     Q       RCO");

    ENB = 1'b1;
    MODO = 2'b11;
    D[3:0] = 4'bxxxx;
    #1; #1;

    D[3:0] = 4'b0000; 
    #1; #1;

    D[3:0] += 1'b1; 
    #1; #1;

    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1;
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;
    D[3:0] += 1'b1; 
    #1; #1;


    D[3:0] = 4'bxxxx;
    ENB = 1'b0;

    #1; #1;

    #5 $finish;


end */
endmodule 


////////////////////////////////////////////////////////
module tester16 (
    output reg CLK,
    output reg ENB,
    output reg [1:0] MODO,
    output reg [15:0] entrada,
    input RCO,
    input RCO162,
    input RCO163,
    input RCO164,
    input [15:0] salida
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
    $display("Prueba #1: Cuenta ascendente");
    $display("ENB    MODO   D        Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    entrada[15:0] = 16'b0000_0000_0000_0000;
    MODO = 2'b11;
    entrada[15:0] = 16'b0000_0000_0000_0000;

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    #1; #1;
    MODO = 2'b00; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj
    /*Para este caso es muy importante que tomemos en cuenta que el RCO no sera
    igual a 1, hasta que a 1111 no se le sume 1, en este caso ya tomaria el llevo
    y RCO = 1 */
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
    #1; #1; //


    $display("\nPrueba #2: Cuenta descendente");
    $display("ENB   MODO   D        Q       RCO");

    //primera instruccion 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    entrada[15:0] = 16'b1111_1111_1111_1111; //Inicio en 1111

    //segunda y tercera instruccion
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    #1; #1;

    MODO = 2'b01; // Esta en 0000 para iniciar

    // se envian 16 flancos de reloj
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


    $display("\nPrueba #3: Cuenta de tres en tres hacia abajo");
    $display("ENB   MODO   D        Q       RCO");

    ENB = 1'b1;
    MODO = 2'b01;
    entrada[15:0] = 16'b0000_0000_0000_0000;

    #1;#1;
    MODO = 2'b10;

    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;
    #1; #1;


    $display("\nPrueba #5: Carga en paralelo");
    $display("ENB   MODO   D     Q       RCO");

    ENB = 1'b1;
    MODO = 2'b11;
    entrada[15:0] = 16'bxxxx_xxxx_xxxx_xxxx;
    #1; #1;

    entrada[15:0] = 16'b0000_0000_0000_0000; 
    #1; #1;

    entrada[15:0] += 1'b1; 
    #1; #1;

    entrada[15:0] += 1'b1;  
    #1; #1;
    entrada[15:0] += 1'b1; 
    #1; #1;
    entrada[15:0] += 1'b1;  
    #1; #1;
    entrada[15:0] += 1'b1; 
    #1; #1;
    entrada[15:0] += 1'b1;  
    #1; #1;

    entrada[15:0] = 4'bxxxx;
    ENB = 1'b0;

    #1; #1;

    #5 $finish;


end 
endmodule
