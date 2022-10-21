`include "IC2.v"
`include "tester.v"


//TESTBENCH
module testbench;
wire clk, rst, sda_in, start_stb, rnw, scl, sda_oe, sda_out;
wire[6:0] i2c_addr;
wire [15:0] wr_data;
wire [15:0] rd_data; 

//DUT
IC2 IC2_DUT (
    .CLK(clk),
    .RESET(rst),
    .SDA_IN(sda_in),
    .RNW(rnw),
    .START_STB(start_stb),
    .IC2_ADDR(i2c_addr[6:0]),
    .WR_DATA(wr_data[15:0]),
    .SCL(scl),
    .SDA_OE(sda_oe),
    .SDA_OUT(sda_out),
    .RD_DATA(rd_data[15:0])
);

//TESTER
tester TESTER (
    .CLK(clk),
    .RESET(rst),
    .SDA_IN(sda_in),
    .RNW(rnw),
    .START_STB(start_stb),
    .IC2_ADDR(i2c_addr[6:0]),
    .WR_DATA(wr_data[15:0]),
    .SCL(scl),
    .SDA_OE(sda_oe),
    .SDA_OUT(sda_out),
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
