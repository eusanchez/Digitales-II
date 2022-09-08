module FF #(parameter BITS = 1) (
    input CLK,
    input EN,
    input [BITS-1:0] D,
    output reg [BITS-1:0] Q);

    always @(posedge CLK) begin
        if (EN == 1'b1)
            Q <= D;
    end

endmodule