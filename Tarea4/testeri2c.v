
module tester 
(
    output reg clk,
    output reg rst,
    input sda_out,
    input sda_oe
);



initial begin
    clk = 0;
    forever begin
        clk = #1 ~clk;
    end
end

initial begin
    #10;
    $finish;
end




endmodule