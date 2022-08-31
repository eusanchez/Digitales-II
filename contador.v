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



/* Utilizando las senales MODO[1:0] como de seleccion,
se determina el valor de d_In y d_Out, cada uno de los
casos contiene al numero de modo, siendo por ejemplo:
3'b00, refiriendose al MODO=00 donde en este caso ocurre Q+1, y
asi sucesivamente. 
*/
always @* begin
    case (MODO[1:0])
    //   caso         valor de RCO     valor de D[3:0]
        3'b00 : begin d_Out = 1'b1;  d_In = Q+1; end // CUENTA ASCENDENTE
        3'b01 : begin d_Out = 1'b0;  d_In = Q-1; end // CUENTA DESCENDENTE
        3'b10 : begin d_Out = 1'b0;  d_In = Q-3; end // CUENTA DE TRES EN TRES HACIA ABAJO
        3'b11 : begin d_Out = 1'b1;  d_In = D; end // CARGA EN PARALELO
        default: begin d_Out = d_Out; d_In = d_In;           end // no cambiar los valores en otro caso.
    endcase
end

/*En esta seccion de codigo nombramos los ff hechos, donde se nombran luego de
incluirr el archivo principal en la primera linea de codigo. Es importante mencionar
que se hace uso de una etiqueta el cual clasificara el proceso que se ejecuta
por lo que se veria de la siguiente manera: NOMBRE_MODULO etiqueta*/

/*Nota importante: .BITS(4), hace referencia a algo mencionado en el archivo ff.v,
donde a lo que hace referencia es a 4 bits.*/

DFF_nbits_enb #(.BITS(4)) DFF_4bits(.clk(CLK), .enb(ENB), .d(d_In[3:0]), .q(Q[3:0])); // Registro de 4bits para Q[3:0]
DFF_nbits_enb DFF_1bit(.clk(CLK), .enb(ENB), .d(d_Out), .q(RCO)); // Registro de 1bit para RCO

endmodule


