`include "I2C.v"
`include "testeri2c.v"

module testbench();
wire clk, rst, sda_out, sda_oe;


I2C dut
(
    .clk(clk)          ,
    .rst(rst)          ,
    .sda_out(sda_out)  ,
    .sda_oe(sda_oe)    

);

tester TESTER
(
    .clk(clk)          ,
    .rst(rst)          ,
    .sda_out(sda_out)  ,
    .sda_oe(sda_oe)    
);

initial begin
    $dumpfile("testbench.vcd");
    $dumpvars;
end

endmodule
