`include "I2C.v"
`include "tester.v"

module testbench();

    wire SCL;
    wire SDA_OE;
    wire SDA_OUT;
    wire [15:0] RD_DATA;
    wire [15:0] WR_DATA;
    wire START_STB;
    wire [6:0]I2C_ADDR;
    wire CLK;
    wire RST;
    wire SDA_IN;
    wire RNW;

        I2C DUT(.SCL(SCL), 
                    .SDA_OE(SDA_OE), 
                    .SDA_OUT(SDA_OUT), 
                    .RD_DATA(RD_DATA), 
                    .WR_DATA(WR_DATA), 
                    .START_STB(START_STB), 
                    .I2C_ADDR(I2C_ADDR), 
                    .RNW(RNW), 
                    .CLK(CLK), 
                    .RST(RST), 
                    .SDA_IN(SDA_IN));

    tester TESTER (.SCL(SCL), 
                    .SDA_OE(SDA_OE), 
                    .SDA_OUT(SDA_OUT), 
                    .RD_DATA(RD_DATA),
                    .WR_DATA(WR_DATA), 
                    .START_STB(START_STB), 
                    .I2C_ADDR(I2C_ADDR), 
                    .RNW(RNW), 
                    .CLK(CLK), 
                    .RST(RST), 
                    .SDA_IN(SDA_IN));

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars;
    end


endmodule
