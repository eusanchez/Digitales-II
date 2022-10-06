`include "contadores.v"

module MDIO (
    input CLK,
    input RESET,
    input MDIO_IN,
    input MDIO_START,
    input [31:0] T_DATA,
    output MDC,
    output reg MDIO_OE,
    output reg MDIO_OUT,
    output reg DATA_RDY,
    output reg [15:0] RD_DATA
);


//Contador para generar un reloj con la mitad de frecuencia que es la mitad de CLK
contador2 mitad_frecuencia (
    .CLK(CLK),
    .RESET(RESET || ~(MDC === 1'bx)),
    .RESULT(MDC)
);


//Para guardar los registros de T_DATA
reg [31:0] D;

//Para guardar si estamos en modo de lectura o escritura
reg [1:0] OPCODE;

//Indica la iniciacion de un metodo de escritura o lectura
reg start_transmission;

//Indica cuantos bits de datos se han transmitido a S_OUT
wire [4:0] contador;

//Al ser start_transmission la senal del ENB, solo se va a encender cuando start_transmission == 1
contador32 contador32 (
    .CLK(MDC),
    .RESET(RESET),
    .ENB(start_transmission),
    .RESULT(contador[4:0]) //para poder llegar al numero deseado en binario
);


//Inicio de transaccion y prueba de reset == 0, todos lo registros se vuelven cero.
always @(posedge MDC) begin
     if (RESET == 0) begin
        start_transmission <= 0;
        MDIO_OUT <= 0;
        MDIO_OE <= 0;
        OPCODE[1:0] <= 0;
        DATA_RDY <= 0;
        RD_DATA[15:0] <= 0;
    end
    
    else if (MDIO_START && T_DATA[31:30] == 2'b01 && ~start_transmission) begin 
        start_transmission <= 1'b1;     //comienza a start_transmission

    
        DATA_RDY <= 1'b0;  //Se pone en cero, debido a que es una nueva transaccion al finalizar vuelve a 1.

        //recordemos que esta transaccion va a funcionar siempre y cuando no haya una de por medio.
        D[31:0] <= T_DATA[31:0]; 
        OPCODE <= T_DATA[29:28]; 
    end

// Detener la transmision de datos cuando ya hayan 32 bits.
    else if (contador == 5'd31) begin   
        start_transmission <= 1'b0;        
        
        if (OPCODE == 2'b10)       //transaccion de lectura
            DATA_RDY <= 1'b1;  //Transaccion terminada
    end

    //si el contador es cero, y no se esta transmiitiendo nada la senal de mdio oe no se levantara.
    else if (contador == 5'd0 && ~start_transmission)
        MDIO_OE <= 1'b0;

end


// modo de lectura o escritura
always @(posedge MDC) begin
    if (start_transmission) begin    
        MDIO_OUT <= D[31];  //Los datos guardados en D se desplazan a MDIO_OUT
        D = D << 1;         

        case(OPCODE)        // el comportamiento de MDIO_OE y RD_DATA depende de OPCODE
            2'b01: MDIO_OE <= 1'b1;     // si es escritura, MDIO_OE estará en uno por 32 bits

            2'b10:  begin                   
                    if (contador < 5'd16)   // si es lectura, 
                        MDIO_OE <= 1'b1;    // MDIO_OE estará en uno por 16 bits

                    else begin              
                        MDIO_OE <= 1'b0;     
                        RD_DATA[0] <= MDIO_IN;  
                        RD_DATA = RD_DATA << 1; 
                        end 
                    end
            
            default: begin MDIO_OE <= 1'b0; DATA_RDY <= 1'b0; end
        endcase
    end
end



endmodule

