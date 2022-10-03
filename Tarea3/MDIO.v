`include "contadores.v"

module MDIO (
    input CLK,
    input RESET,
    input MDIO_START,
    input MDIO_IN,
    input [31:0] T_DATA,
    output MDC,
    //output regs registros que guardan 1 o mas bits.
    output reg MDIO_OUT,
    output reg DATA_RDY,
    output reg MDIO_OE,
    output reg [15:0] RD_DATA
);

//Para guardar los registros de T_DATA
reg [31:0] regT_DATA;

//Para guardar si estamos en modo de lectura o escritura
reg [1:0] OPCODE;

//Indica la iniciacion de un metodo de escritura o lectura
reg transmitir;

//Indica cuantos bits de datos se han transmitido a S_OUT
wire [4:0] contador;

//Contador para generar un reloj con la mitad de frecuencia que es la mitad de CLK
contador_2 contador1 (
    //. lo del contador 2, () lo del contador de adentro
    .CLK(CLK),
    .RESET(RESET || ~(MCD === 1'bx)),
    .RESULT(MCD)
);

//Al ser transmitir la senal del ENB, solo se va a encender cuando transmitir == 1
contador_32 contador2 (
    .CLK(MCD),
    .RESET(RESET),
    .ENB(transmitir),
    .RESULT(contador[4:0])
);

//Si RESET == 0, todos los registros se vuelven cero. 
always @(posedge MDC) begin
    if (~RESET) begin
        transmitir <= 0;
        MDIO_OUT <= 0;
        MDIO_OE <= 0;
        DATA_RDY <= 0;
        RD_DATA[15:0] <= 0;
        OPCODE <= 0;
    end
end


always @(posedge MDC) begin
    if (MDIO_START && T_DATA[31:30] == 2'b01 && ~transmitir) begin 
        transmitir <= 1'b1;     // empieza a transmitir los datos cuando se le indique (con MDIO_START)
                                
    
        DATA_RDY <= 1'b0;       //Se pone en cero, debido a que es una nueva transaccion al finalizar vuelve a 1.

        D[31:0] <= T_DATA[31:0]; // guarda el valor de P_IN en los registros en el momento que
        OPCODE <= T_DATA[29:28]; // se le indique (con MDIO_START) siempre y cuando esté en idle
    end
// Detener la transmision de datos
    if (contador == 5'd31) begin  
        transmitir <= 1'b0;        
        
        if (OPCODE == 2'b10)       //Cuando se termina la recepcion de una palabra, 10 = transaccion de lectura
            DATA_RDY <= 1'b1;      //Transaccion terminada
        else
            DATA_RDY <= 1'b0;
    end

    if (contador == 5'd0 && ~transmitir)
        MDIO_OE <= 1'b0;
end





always @(posedge MDC) begin
    if (transmitir) begin   // cuando hay una transacción, desplaza el MSB de T_DATA a 
        MDIO_OUT <= regT_DATA[31];  // Desplazamiento de datos de regT_DATA a MDIO_OUT
        regT_DATA = regT_DATA << 1;  // Desplazamiento de bits

        case(OPCODE)        // el comportamiento de MDIO_OE y RD_DATA depende de OPCODE
            2'b01: MDIO_OE <= 1'b1;     // si es escritura, MDIO_OE estará en uno por 32 bits

            2'b10:  begin                   
                    if (contador < 5'd16)   // si es lectura, 
                        MDIO_OE <= 1'b1;    // MDIO_OE estará en uno por 16 bits

                    else begin              
                        MDIO_OE <= 1'b0;        // y captura los datos de MDIO_IN por
                        RD_DATA[0] <= MDIO_IN;  //Capturar lo que haya en MDIO_IN y guardarlo en RD_DATA[0].
                        RD_DATA = RD_DATA << 1; //Desplazamiento de los bits
                        end 
                    end
            
            default: begin MDIO_OE <= 1'b0; DATA_RDY <= 1'b0; end
        endcase
    end
end

