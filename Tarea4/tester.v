module tester (
    input SCL,
    input SDA_OUT,
    input SDA_OE,
    input [15:0] RD_DATA,
    output reg START_STB,
    output reg [15:0] WR_DATA,
    output reg [6:0]I2C_ADDR,
    output reg CLK,
    output reg RST,
    output reg RNW,
    output reg SDA_IN
);


always begin
    CLK = 0; #1;
    CLK = 1; #1;

end

initial begin
    // Prueba 1: reiniciar los registros y salidas
    RST = 0; #1; #1; 
    #1; #1; #1;
    RST = 0; #1; #1;
end

// Instrucciones para el generador de transacciones

initial begin

  
     // Initialize RST
    RST = 0;
    WR_DATA = 0;
    I2C_ADDR = 0;
    RNW = 0;
    SDA_IN = 0;
    START_STB = 0;
    #8;

    // prueba de escritura
    RST = 1;
    START_STB = 1;
    #2; 
    START_STB = 0;
    I2C_ADDR = 7'b1010010;
    #80;
    RNW = 0; 
    #2; 
    WR_DATA = 15'b101010111010111;
    #500;

    // reinicio de pruebas
    RST = 1'b0;
    START_STB = 1'b0;
    I2C_ADDR = 7'b0000000;
    #8;

    // prueba de lectura
    RST = 1;
    START_STB = 1;
    #2;
    START_STB = 0;
    I2C_ADDR = 7'b1010010;
    RNW = 1;
    #100;  
    //RNW = 1;
    #2;

    SDA_IN = 1; #32;
    SDA_IN = 1; #32;
    SDA_IN = 1; #32;
    SDA_IN = 1; #32;
    SDA_IN = 0; #32;
    SDA_IN = 0; #32;
    SDA_IN = 1; #32;
    SDA_IN = 1; #32;
    SDA_IN = 0; #32;
    SDA_IN = 0; #32;
    SDA_IN = 1; #32;
    SDA_IN = 0; #32;
    SDA_IN = 1; #32;
    SDA_IN = 1; #32;
    SDA_IN = 0; #32;
    SDA_IN = 1; #32;
    SDA_IN = 0; #32;

    #1000;
    $finish;
end

endmodule