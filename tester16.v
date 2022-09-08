module tester16 (
    output reg CLK,
    output reg ENB,
    output reg [1:0] MODO,
    output reg [15:0] entrada,
    input RCO,
    input [15:0] salida);


    initial begin
        ENB <= 1'b1;
        CLK <= 1'b1; 
        entrada <= 0;  
    end
    always #1 CLK <= ~CLK; 

    initial begin
        //$display("Prueba #1: Cuenta ascendente");
        //$display("ENB    MODO   D        Q       RCO");
        $dumpfile("resultados.vcd");
        $dumpvars();
        
        
        @(posedge CLK);
        @(posedge CLK);
        ENB <= 1'b1; 
        entrada[15:0] = 16'b0000000000000000;
        MODO <= 2'b11;
        @(posedge CLK);
        @(posedge CLK);
        MODO = 2'b00; 
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1; 
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1;
        #1; #1; 

        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        @(posedge CLK);
        $finish;
    end

endmodule