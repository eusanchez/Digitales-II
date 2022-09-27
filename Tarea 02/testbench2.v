
`include "contador_cmos_nodelay.v"
`include "probador.v"
//`include "contador_RTLIL.v"
`include "cmos_cell_delay.v"
//`include "cmos_cell.v"



// Banco de pruebas para el registro de cuatro bits y el probador

module testbench2;
    wire clk, enb, RC0_y, RCO2_y, RCO3_y, RCO4_y, RC0_cnd, RCO2_cnd, RCO3_cnd, RCO4_cnd;
    wire [1:0] modo;
    wire [15:0] D; 
    wire [15:0] Q_yosys;
    wire [15:0] Q_cmos_nodelay;
    wire [15:0] Q_cmos_delay;


    contador_cmos_nodelay contador_cmos_nodelay_1(
        .CLK(clk), 
        .ENB(enb),
        .MODO(modo[1:0]), 
        .entrada(D[15:0]), 
        .salida(Q_cmos_nodelay[15:0]),
        .RCO(RC0_cnd), 
        .RCO162(RCO2_cnd), 
        .RCO163(RCO3_cnd),
        .RCO164(RCO4_cnd));  

    probador probador_2(
        .CLK(clk), 
        .ENB(enb),
        .MODO(modo[1:0]),
        .entrada(D[15:0]), 
        .salida(Q_cmos_nodelay[15:0]), 
        .RCO(RC0_cnd), 
        .RCO162(RCO2_cnd), 
        .RCO163(RCO3_cnd),
        .RCO164(RCO4_cnd)); 




/* para generar las ondas y visualizar en gtkwave*/
    initial begin
        $dumpfile("testbench_delay.vcd");
        $dumpvars;
    end

    /*always @(posedge clk) begin
        $display("enb=%b     modo=%b     D16=%b      Q16=%b   RCO=%b", enb, modo, D, Q_yosys, RCO_);
    end*/


endmodule


