`include "contador.v"

module contador16 (
    input CLK,
    input ENB,
    input [1:0] MODO,
    input [15:0] entrada,
    output [15:0] salida,
    output RCO 
);

always @* begin
    case (MODO[1:0])
    //   caso         valor de RCO     valor de D[3:0]
        2'b00 : begin RCO = 1'b0;  entrada = salida+1; 
            if (entrada[15:0] == 16'b1111_1111_1111_1111)
            begin 
                RCO = 1'b1; 
            end
        end // CUENTA ASCENDENTE
        2'b01 : begin  RCO = 1'b0;  entrada = salida-1; end // CUENTA DESCENDENTE
        2'b10 : begin RCO = 1'b0;  entrada = salida-3; end // CUENTA DE TRES EN TRES HACIA ABAJO
        2'b11 : begin RCO = 1'b0;  entrada = entrada; end // CARGA EN PARALELO
        default: begin RCO = RCO; entrada = entrada; end // no cambiar los valores en otro caso.
    endcase
    /*case (Q[3:0])
    //   caso 
        4'b1111: begin d_Out = 1'b1; end
    endcase */
end

contador contador1(.CLK(CLK),
 .ENB(ENB), .MODO(MODO[1:0]), .D
(entrada[3:0]), .Q(salida[3:0]),
 .RCO(RCO));

contador contador2(.CLK(CLK),
 .ENB(ENB), .MODO(MODO[1:0]), .D
(entrada[7:4]), .Q(salida[7:4]),
 .RCO(RCO));

contador contador3(.CLK(CLK),
 .ENB(ENB), .MODO(MODO[1:0]), .D
(entrada[11:8]), .Q(salida[11:8]),
 .RCO(RCO));

contador contador4(.CLK(CLK),
 .ENB(ENB), .MODO(MODO[1:0]), .D
(entrada[15:12]), .Q(salida[15:12]),
 .RCO(RCO));





endmodule