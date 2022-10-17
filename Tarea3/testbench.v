`include "MDIO.v"
`include "tester.v"


//TESTBENCH
module testbench;
wire clk, rst, mdio_in, mdio_start, mdc, mdio_oe, mdio_out, data_rdy;
wire [31:0] t_data;
wire [15:0] rd_data; 

//DUT
MDIO MDIO_DUT (
    .CLK(clk),
    .RESET(rst),
    .MDIO_IN(mdio_in),
    .MDIO_START(mdio_start),
    .T_DATA(t_data[31:0]),
    .MDC(mdc),
    .MDIO_OE(mdio_oe),
    .MDIO_OUT(mdio_out),
    .DATA_RDY(data_rdy),
    .RD_DATA(rd_data)
);

//TESTER
tester TESTER (
    .CLK(clk),
    .RESET(rst),
    .MDIO_IN(mdio_in),
    .MDIO_START(mdio_start),
    .T_DATA(t_data[31:0]),
    .MDC(mdc),
    .MDIO_OE(mdio_oe),
    .MDIO_OUT(mdio_out),
    .DATA_RDY(data_rdy),
    .RD_DATA(rd_data)
);


/* para generar las ondas y
y visualizar en gtkwave
*/
initial begin
    $dumpfile("testbench.vcd");
    $dumpvars;
end


endmodule
