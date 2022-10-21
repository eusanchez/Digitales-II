`include "contadores.v"

module IC2 (
    input CLK,
    input RESET,
    input START_STB, //DICE CUANDO SE QUIERE INICIAR UNA TRANSACCION
    input RNW, // cuando =1 transaccion de lectura, =0 transaccion de escritura
    input [15:0] WR_DATA,
    input [6:0] IC2_ADDR,
    input SDA_IN, //como el MDIO_IN
    output SCL, //como el MDC, nada mas que esta vez al 25%
    output reg SDA_OE,
    output reg SDA_OUT, //como MDIO_OUT
    output reg [15:0] RD_DATA 
);


//aqui se guarda la el comportamiento al 50% de la senal de reloj
//reg MDC;
//Contador para generar un reloj con la mitad de frecuencia que es la mitad de CLK
contador2 mitad_frecuencia (
    .CLK(CLK),
    .RESET(RESET || ~(MDC === 1'bx)),
    .RESULT(MDC)
);

//25% de la frecuencia del reloj original 
contador2 frecuencia_al_25 (
    .CLK(MDC),
    .RESET(RESET || ~(SCL === 1'bx)),
    .RESULT(SCL)
);

reg [7:0] D;
reg [15:0] WR;


//Indica la iniciacion de un metodo de escritura o lectura
reg start_transmission;
reg start_data;


//Indica cuantos bits de datos se han transmitido a S_OUT
wire [4:0] contador;

//Al ser start_transmission la senal del ENB, solo se va a encender cuando start_transmission == 1
contador32 contador22 (
     .CLK(SCL),
     .RESET(RESET),
     .ENB(start_transmission),
     .RESULT(contador[4:0]) //para poder llegar al numero deseado en binario
);


//Inicio de transaccion y prueba de reset == 0, todos lo registros se vuelven cero.
always @(posedge CLK) begin
    if (RESET == 0) begin
        start_transmission <= 0;
        SDA_OUT = 0;
        SDA_OE = 0;
        RD_DATA[15:0] <= 0;
        start_data <= 0;
     end
     else if (start_data) begin
     end
end

always @(posedge SCL) begin
    if (START_STB) begin 
        start_data <= 1'b1;   
        SDA_OUT = 0;
        SDA_OE = 1'b1;
    end


     //si el contador es cero, y no se esta transmiitiendo nada la senal de mdio oe no se levantara.
     else if (contador == 5'd0 && ~start_transmission)
         SDA_OE <= 1'b0;

end

always @(start_data) begin
    D[0] <= RNW; 
    D[7:1] <= IC2_ADDR[6:0]; 
    WR[15:0] <= WR_DATA[15:0];
    //RD_DATA = 16'b1010_1011_0110_0011;
    start_transmission = 1'b1;
end




// modo de lectura o escritura
always @(posedge SCL) begin
     if (start_transmission) begin  
        start_data = 0;
        SDA_OUT <= D[7];  //Los datos guardados en D se desplazan a MDIO_OUT
        D = D << 1;
        if (contador > 5'd7 || contador == 5'b10100) begin //AKC
            SDA_OUT <= 1'b1;
            if (contador > 5'd8)
            SDA_OUT <= 0;

        end
     end
end
always @(posedge SCL) begin
    if (contador > 5'd9) begin
                case(RNW)        
                //ESCRITURA
                1'b1: begin 
                    SDA_OE <= 1'b1;   
                    SDA_OUT <= WR[15];
                    WR = WR << 1;
                    RD_DATA = 0;
                end
                //LECTURA
                1'b0:  begin
                    if (contador > 5'd9) begin
                    SDA_OE <= 1'b0;     
                    RD_DATA[0] <= SDA_IN;  
                    RD_DATA = RD_DATA << 1;
                    SDA_OUT = 0;
                end   
                end          
                default: begin SDA_OE <= 1'b0; end
                endcase
            end

        end

        //SDA_OE = 1'b1;      
        /*if (contador > 5'd8) begin
            case(RNW)        
                //ESCRITURA
                1'b1: begin 
                    if (contador < 5'd8) begin
                    SDA_OE <= 1'b1;   
                    SDA_OUT <= WR[15];
                    WR = WR << 1;
                    //RD_DATA = 0;
                    end
                end

                //LECTURA
                1'b0:  begin
                    SDA_OE <= 1'b0;     
                    RD_DATA[0] <= SDA_IN;  
                    RD_DATA = RD_DATA << 1;
                    SDA_OUT = 0;
                end             
                default: begin SDA_OE <= 1'b0; end
            endcase
        end*/
        //end
//end

endmodule
