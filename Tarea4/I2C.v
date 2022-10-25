module I2C 
(
    input CLK                   ,
    input RST                 , 
    input START_STB             ,
    input RNW                   ,
    input SDA_IN                ,
    input [6:0]I2C_ADDR         ,
    input [15:0]WR_DATA         , 
    output SCL                  , 
    output reg SDA_OUT          ,  
    output reg SDA_OE           , 
    output reg [15:0]RD_DATA
);
    
    reg [3:0] estado;
    reg [15:0] guardar;

    reg [6:0] contador;
    reg [15:0] cuenta;
    reg RW;
    reg [15:0] bits_rddata; // agarra lo que este en los primeros 7 bits del RD_DATA para poder hacer la conversion
    reg [7:0] read_cnt; // cambiar nombre




    reg [3:0] RESULT = 0;
    always@(posedge CLK) begin
        RESULT = RESULT + 1'b1;
    end
    assign SCL = RESULT[2];

    // RST = 0, registros = 0
    always @(posedge CLK) begin
        if (~RST) begin
            RD_DATA <= 0;
            SDA_OUT <= 0;
            SDA_OE <= 0;
            estado <= 0;
            contador <= 0;
            cuenta <= 16'd16;
        end
    end

    always @(posedge SCL)begin

        if (RST) begin


                //IDLE
            if (estado == 4'b0000)begin
                SDA_OUT <= 0;
                estado <= 4'b0001; 
                SDA_OE <= 0;
            end

                //START
            if (estado == 4'b0001) begin
                estado <= 4'b0010;
                contador <= 6;    
                SDA_OE <= 0;     // Este contador leer el MSB del I2C_ADDR
                SDA_OUT <= 1;
            end

                //SLAVE
            if (estado == 4'b0010)begin
                
                estado <= 4'b0010;
                SDA_OUT <= I2C_ADDR[contador];
                SDA_OE <= 1;

                if (contador == 0) begin
                    estado <= 4'b0011;
                end else begin
                    contador <= contador - 1;
                end
            end

                //RNW
            if (estado == 4'b0011)begin
                SDA_OE <= 0;
                SDA_OUT <= RNW;
                estado <= 4'b0100;
            end

                //ACK
            if (estado == 4'b0100) begin
                RW = RNW;
                if (RW == 0)begin   // Modo de Escritura
                    estado <= 4'b0101; 
                    cuenta <= 7;
                    bits_rddata <= WR_DATA[15:8];
                    SDA_OUT = 1;
 
              
                end else if (RW == 1) begin  // Modo de Lectura
                    estado <= 4'b0110;
                    cuenta <= 7;
                    guardar[15:0] <= RD_DATA[15:0];
                    SDA_OUT = 1;


                end
            end

                //WRITE
            if (estado == 4'b0101) begin
                SDA_OUT <= bits_rddata[cuenta];
                

                if (cuenta == 0) begin
                    estado <= 4'b0111;
                end else begin
                    cuenta <= cuenta - 1;
                end

            end

                //READ
            if (estado == 4'b0110) begin

                RD_DATA[cuenta] <= SDA_IN;  
                SDA_OUT <= RD_DATA[cuenta];
                if (cuenta == 0) begin
                    estado <= 4'b1000;
                end else begin
                    cuenta <= cuenta - 1;
                end

            end

                //ACK WRITE
            if (estado == 4'b0111) begin
                SDA_OUT <= 1;
                SDA_OE <= 0;
                estado <= 4'b1001;
                bits_rddata <= WR_DATA[7:0];
                cuenta <= 7;
            end

                //ACK READ
            if (estado == 4'b1000) begin
                SDA_OUT <= 0;
                SDA_OE <= 0;
                estado <= 4'b1010;
                read_cnt <= 7;
            end

                //ME COMPLETA LOS OTROS BITS DEL ACKNOLEDGE WRITE
            if(estado == 4'b1001) begin
                SDA_OUT <= bits_rddata[cuenta];
                SDA_OE <= 1;

                if (cuenta == 0) begin
                    estado <= 4'b1011;
                end else begin
                    cuenta <= cuenta - 1;
                end
            end

                //ME COMPLETA LOS OTROS BITS DEL ACK READ
            if (estado == 4'b1010) begin
                RD_DATA[read_cnt] <= SDA_IN;
                SDA_OUT <= guardar[read_cnt];

                if (read_cnt == 0) begin
                    estado <= 4'b1011;
                end else begin
                    read_cnt <= read_cnt - 1;
                end
            end

                //~ACK
            if (estado == 4'b1011) begin
                SDA_OUT <= 0;
                estado <= 4'b1111;
            end

                //CONDICION DE PARADA
            if (estado == 4'b1111) begin
                SDA_OUT <= 1;
                estado <= 4'b0000;
            end 

        end


    end

endmodule
