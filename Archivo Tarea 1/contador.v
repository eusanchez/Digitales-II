`include "ff.v" //archivo de flipflop

module contador (
    input CLK,
    input ENB,
    input [1:0] MODO,
    input [3:0] D,
    output [3:0] Q,
    output RCO 
);

reg [3:0] d_In;
reg d_Out;

/* Utilizando las senales MODO[1:0] como de seleccion, se determina el valor de d_In y d_Out, cada uno de los
casos contiene al numero de modo, siendo por ejemplo: 3'b00, refiriendose al MODO=00 donde en este caso ocurre Q+1, y
asi sucesivamente. */
initial begin 
    d_In = 4'b0000;
end

always @* begin
    case (MODO[1:0])
    //   caso         valor de RCO     valor de D[3:0]
        2'b00 : begin d_Out = 1'b0;  d_In = Q+1; 
            if (Q[3:0] == 4'b1111)
            begin 
                d_Out = 1'b1; 
            end else begin
                d_Out = 1'b0;
            end
        end // CUENTA ASCENDENTE
        2'b01 : begin d_Out = 1'b0;  d_In = Q-1; 
            if (Q[3:0] == 4'b0000 )
            begin
                d_Out = 1'b1;
            end else begin
                d_Out = 1'b0;
            end
        end // CUENTA DESCENDENTE
        2'b10 : begin d_Out = 1'b0;  d_In = Q-3;
            if (Q[3:0] == 4'b0000 || Q[3:0] == 4'b0001 || Q[3:0] == 4'b0010 )
            begin
                d_Out = 1'b1;
            end else begin
                d_Out = 1'b0;
            end end // CUENTA DE TRES EN TRES HACIA ABAJO
        2'b11 : begin d_Out = 1'b0;  d_In = D; 
            if (Q[3:0] == 4'b1111)
            begin 
                d_Out = 1; 
            end else begin
                d_Out = 1'b0;
            end end // CARGA EN PARALELO
        default: begin d_Out = d_Out; d_In = d_In; end // no cambiar los valores en otro caso.
    endcase
end

/*En esta seccion de codigo nombramos los ff hechos, donde se nombran luego de incluir el archivo principal en la primera linea de codigo. 
Es importante mencionar que se hace uso de una etiqueta el cual clasificara el proceso que se ejecuta por lo que se veria de la siguiente 
manera: NOMBRE_MODULO etiqueta*/

/*Nota importante: .BITS(4), hace referencia a algo mencionado en el archivo ff.v, donde a lo que hace referencia es a 4 bits.*/
//FF #(.BITS(4)) DFF_4bits(.CLK(CLK), .EN(ENB), .D(d_In[3:0]), .Q(Q[3:0])); // Registro de 4bits para Q[3:0]

FF DFF_0(.CLK(CLK), .EN(ENB), .D(d_In[0]), .Q(Q[0])); // Registro de 4bits para Q[0]
FF DFF_1(.CLK(CLK), .EN(ENB),  .D(d_In[1]), .Q(Q[1])); // Registro de 4bits para Q[1]
FF DFF_2(.CLK(CLK), .EN(ENB), .D(d_In[2]), .Q(Q[2])); // Registro de 4bits para Q[2]
FF DFF_3(.CLK(CLK), .EN(ENB), .D(d_In[3]), .Q(Q[3])); // Registro de 4bits para Q[3]


FF DFF_1bit(.CLK(CLK), .EN(ENB), .D(d_Out), .Q(RCO)); // Registro de 1bit para RCO

endmodule


module contador16 (
    input CLK,
    input ENB,
    input [1:0] MODO,
    input [15:0] entrada,
    output [15:0] salida,
    output RCO, 
    output RCO162, 
    output RCO163, 
    output RCO164 ); 

reg d_Out1;
reg d_Out2;
reg d_Out3;
reg d_Out4;


contador contador1(
    .CLK(CLK),
    .ENB(ENB), 
    .MODO(MODO[1:0]), 
    .D(entrada[3:0]), 
    .Q(salida[3:0]),
    .RCO(RCO));

wire clk2;
wire modo11;
assign modo11 = (MODO == 2'b11);
assign modo00 = (MODO == 2'b00);
assign clk2 = CLK && modo11 || RCO && !modo11;

always @* begin

    case(MODO[1:0]) 
        2'b00: begin 
            if (entrada[15:0] == 16'b1111_1111_1111_1111)
                begin 
                    d_Out1 = 1'b1;
                end else begin
                    d_Out1 = 1'b0; 
                end
            end
     
        2'b01: begin 
            if (entrada[15:0] == 16'b0000_0000_0000_0000)
                begin 
                    d_Out1 = 1'b1;
                end else begin
                    d_Out1 = 1'b0; 
                end
            end

        2'b10: begin 
            if (entrada[15:0] == 16'b0000_0000_0000_0000 || entrada[15:0] == 16'b0000_0000_0000_0001 || entrada[15:0] == 16'b0000_0000_0000_0010 )
                begin 
                    d_Out1 = 1'b1;
                end else begin
                    d_Out1 = 1'b0; 
                end
            end
    endcase
    end

contador contador2(
    .CLK(clk2),
    .ENB(ENB), 
    .MODO(MODO[1:0]), 
    .D(entrada[7:4]), 
    .Q(salida[7:4]),
    .RCO(RCO162));

wire clk3;
wire modo113;
assign modo113 = (MODO == 2'b11);
assign clk3 = clk2 && modo113 || RCO162 && !modo113;

always @* begin
    case(MODO[1:0]) 
        2'b00: begin 
                if (entrada[15:0] == 16'b1111_1111_1111_1111)
                    begin 
                        d_Out2 = 1'b1;
                    end else begin
                        d_Out2 = 1'b0; 
                    end

            end
    2'b01: begin 
            if (entrada[15:0] == 16'b0000_0000_0000_0000)
                begin 
                    d_Out2 = 1'b1;
                end else begin
                    d_Out2 = 1'b0; 
                end

            end
    2'b10: begin 
            if (entrada[15:0] == 16'b0000_0000_0000_0000 || entrada[15:0] == 16'b0000_0000_0000_0001 || entrada[15:0] == 16'b0000_0000_0000_0010 )
                begin 
                    d_Out2 = 1'b1;
                end else begin
                    d_Out2 = 1'b0; 
                end
            end
    endcase
    end


contador contador3(
    .CLK(clk3),
    .ENB(ENB), 
    .MODO(MODO[1:0]), 
    .D(entrada[11:8]), 
    .Q(salida[11:8]),
    .RCO(RCO163));

wire clk4;
wire modo114;
assign modo114 = (MODO == 2'b11);
assign clk4 = clk3 && modo114 || RCO163 && !modo114;

    always @* begin
    case(MODO[1:0]) 
        2'b00: begin 
    
            if (entrada[15:0] == 16'b1111_1111_1111_1111)
                begin 
                    d_Out3 = 1'b1;
                end else begin
                    d_Out3 = 1'b0; 
                end

                end
     
        2'b01: begin 

            if (entrada[15:0] == 16'b0000_0000_0000_0000)
                begin 
                    d_Out3 = 1'b1;
                end else begin
                    d_Out3 = 1'b0; 
                end

                end

        2'b10: begin 

            if (entrada[15:0] == 16'b0000_0000_0000_0000 || entrada[15:0] == 16'b0000_0000_0000_0001 || entrada[15:0] == 16'b0000_0000_0000_0010 )
                begin 
                    d_Out3 = 1'b1;
                end else begin
                   d_Out3 = 1'b0; 
                end

                end

    endcase

    end

contador contador4(
    .CLK   (clk4),
    .ENB   (ENB), 
    .MODO  (MODO[1:0]), 
    .D     (entrada[15:12]), 
    .Q     (salida[15:12]),
    .RCO   (RCO164)
);

endmodule
