module tester (
    input SCL,
    input SDA_OE,
    input SDA_OUT,
    input [15:0] RD_DATA,
    output reg CLK,
    output reg RESET,
    output reg SDA_IN,
    output reg [6:0] IC2_ADDR,
    output reg RNW,
    output reg START_STB,
    output reg [15:0] WR_DATA
);

//Creacion del reloj
always begin
    CLK = 1'b0; #0.5;
    CLK = 1'b1; #0.5;
end

// Pone todos los registros en cero
initial begin 
    RESET = 1'b0; #2; 
    #3;
    RESET = 1'b1; #2;
end


//Instrucciones para el generador de transacciones
initial begin

  
    //PRUEBA DE ESCRITURA
    SDA_IN = 1'b1; #2;
    SDA_IN = 0; #2;
    START_STB = 1'b0; #2;
    START_STB = 1'b1; #2;
    //START_STB = 1'b0; #2;
    IC2_ADDR = 7'b1010010;
    WR_DATA = 16'b1010_1000_0000_0001;
    RNW = 1'b1; #4; 
    START_STB = 0;
    #90;
    //WR_DATA = 16'b1000_0101_1010_0011; // segunda palabra
    #100; 


    //RUEBA DE LECTURA
    RESET = 0; #2;
    RESET = 1'b1; #2;
    //SDA_IN = 1; #1;
    START_STB = 1'b1; #2;
    //START_STB = 1'b0; #2;
    IC2_ADDR = 7'b1010010;
    RNW = 1'b0; #4;
    START_STB = 0;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    SDA_IN = 1; #5;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    SDA_IN = 1; #5;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    SDA_IN = 1; #5;
    SDA_IN = 1; #5;
    SDA_IN = 0; #5;
    //START_STB = 0;
    #90;
    //WR_DATA = 16'b1000_0101_1010_0011; // segunda palabra
    #60; #8;
    #8; 
    #100;




    $finish;

end

endmodule
