module tester (
    input MDC,
    input MDIO_OE,
    input MDIO_OUT,
    input DATA_RDY,
    input [15:0] RD_DATA,
    output reg CLK,
    output reg RESET,
    output reg MDIO_IN,
    output reg MDIO_START,
    output reg [31:0] T_DATA
);

//Creacion del reloj
always begin
    CLK = 1'b0; #0.5;
    CLK = 1'b1; #0.5;
end

// Pone todos los registros en cero
initial begin
    // Prueba 1: reiniciar los registros y salidas
    RESET = 1'b0; #1; #1; // 2 ciclos completos de reloj con reset en cero.
    #1; #1; #1; // 3 ciclos de reloj completos
    RESET = 1'b1; #1; #1; // 2 ciclos completos de reloj con reset en uno.
end

//Instrucciones para el generador de transacciones
initial begin
    MDIO_START = 1'b0;

    // Prueba 2: Palabra que no cumple con ST = 01 (start of frame)
    T_DATA = 32'h1A3B07E4; #1; #1; // primera palabra
    #8;

    MDIO_START = 1'b1; #1; #1; // pulso MDIO_START: indica el inicio de transmisión de datos
    MDIO_START = 1'b0; #1; #1; T_DATA = 32'hCAFECAFE;// se cambia T_DATA durante la transmisión de datos
    
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos

    MDIO_START = 1'b1; #1; #1;  // pulso MDIO_START durante
    MDIO_START = 1'b0; #1; #1;  // la transmisión de datos

    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos

    // Prueba 3: lectura
    T_DATA = 32'h6A3BC69F; // segunda palabra

    MDIO_START = 1'b1; #1; #1; // pulso MDIO_START: indica el inicio de transmisión de datos
    MDIO_START = 1'b0; #1; #1;


    #1; #1; #1; #1; 
    
    T_DATA = 32'hCAFECAFE; // se cambia T_DATA durante la transmisión de datos
    
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #4;
    
    MDIO_START = 1'b1; #1; #1;  // pulso MDIO_START durante
    MDIO_START = 1'b0; #1; #1;  // la transmisión de datos

    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8; // 8 ciclos de reloj completos
    #8;

    // Prueba 4: escritura
    T_DATA = 32'h5A3B07E4; // tercera palabra
    #1; #1; #1; #1;

    MDIO_START = 1'b1; #1; #1; // pulso MDIO_START: indica el inicio de transmisión de datos
    MDIO_START = 1'b0; #1; #1;
end

/*  Valores "aleatorios" de
    MDIO_IN.
*/
initial begin
    MDIO_IN = 1'b1; #1; #1; #1; #1; 
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1; 
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;    
    MDIO_IN = 1'b0; #1; #1; #1; #1; 
    MDIO_IN = 1'b0; #1; #1; #1; #1; 
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b0; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;
    MDIO_IN = 1'b1; #1; #1; #1; #1;


    $finish;
end

endmodule