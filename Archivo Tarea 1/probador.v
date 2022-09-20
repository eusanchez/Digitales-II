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

//Seccion 3.1.1 Contador ascendente de 4 bits
/*initial begin
    $display("Prueba #1: Cuenta ascendente");


    //1. 
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    D[3:0] = 4'b0000;

    //2.
    /*Con esta se pretende enviar el flanco activo en CLK y establecer el MODO igual a  2'b00*/
    //#1; #1;
    //MODO = 2'b00; // Esta en 0000 para iniciar

    //3.
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

//Seccion 3.2.1 Contador descendente de 4 bits
    $display("\nPrueba #2: Cuenta descendente");


    //1.
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    D[3:0] = 4'b1111; //Inicio en 1111

    //2.
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    /*#1; #1;
    MODO = 2'b01; // Esta en 0000 para iniciar

    //3.
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

//Seccion 3.3.1 Contador de 3 en 3 hacia abajo de 4 bits
    $display("\nPrueba #3: Cuenta de tres en tres hacia abajo");


    //1.
    ENB = 1'b1;
    MODO = 2'b01;
    D[3:0] = 4'b0000;

    //2.
    #1;#1;
    MODO = 2'b10;

    //3.
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

//Seccion 3.4.2 Contador de carga paralela de 4 bits
    $display("\nPrueba #5: Carga en paralelo");


    //1.
    ENB = 1'b1;
    MODO = 2'b11;
    D[3:0] = 4'bxxxx;
    #1; #1;

    //2.
    D[3:0] = 4'b0000; 
    #1; #1;

    //3.
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

    #2 $finish;


end*/
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
    entrada = 0;  
end


// Seccion 3.1.2 Contador de 16bits
  initial begin
    $display("Prueba #1: Cuenta ascendente");

    //1.
    ENB = 0;
    #2;
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    entrada[15:0] = 16'h0000;
    MODO = 2'b11;
    entrada[15:0] = 16'h0000;

    //2.
    //Con esta se pretende enviar el flanco activo en CLK y establecer el MODO igual a  2'b00
    #1; #1;
    MODO = 2'b00; // Esta en 0000 para iniciar

    //3.
    /*Para este caso es muy importante que tomemos en cuenta que el RCO no sera igual a 1, hasta que a 1111 no se le sume 1, en este caso 
    ya tomaria el llevo y RCO = 1 */
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


// Seccion 3.2.2 Contador descendente de 16 bits.
    $display("\nPrueba #2: Cuenta descendente");


    //1.
    ENB = 1'b1; //activo el enable por que quiero que este empieza a cambiar
    MODO = 2'b11;
    entrada[15:0] = 16'hffff; 

    //2.
    /*Con esta se pretende enviar el flanco activo en CLK
    y establecer el MODO igual a  2'b00*/
    #1; #1;

   MODO = 2'b01; // Esta en 0000 para iniciar

    //3.
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

//Seccion 3.3.2  Contador de tres en tres hacia abajo de 16 bits.
    $display("\nPrueba #3: Cuenta de tres en tres hacia abajo");

    //1.
     #1; #1;
    ENB = 1'b1;
    MODO = 2'b11;
    entrada[15:0] = 16'hffff;

    //2.
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



//Seccion 3.4.2 Contador de carga paralela de 16 bits.
   $display("\nPrueba #5: Carga en paralelo");


    //1.
    ENB = 1'b1;
    MODO = 2'b11;
    //entrada[15:0] = 16'hxxxx;
    //#1; #1;

    //2.
    entrada[15:0] = 16'h0000; 
    #1; #1;

    //3.
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
    entrada[15:0] += 1'b1; 
    #1; #1;
    entrada[15:0] += 1'b1;  
    #1; #1;
    entrada[15:0] += 1'b1;  
    #1; #1;


    entrada[15:0] = 16'h0;
    ENB = 1'b0;

    #1; #1; 

    #2 $finish;



end 
endmodule
