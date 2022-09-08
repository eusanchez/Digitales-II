`timescale 1ns/1ns
`include "contador16.v" 
`include "tester16.v" 

module testbench16; 

	wire CLK, ENB, RCO;
	wire [1:0] MODO;
	wire [15:0] salida, entrada; 

	contador16 contador16_1(/*AUTOINST*/
		// Outputs
		.salida		(salida[15:0]),
		.RCO		(RCO),
		// Inputs
		.CLK		(CLK),
		.ENB		(ENB),
		.MODO		(MODO[1:0]),
		.entrada	(entrada[15:0]));

	tester16 testerINST(/*AUTOINST*/
		// Outputs
		.CLK		(CLK),
		.ENB		(ENB),
		.MODO		(MODO[1:0]),
		.entrada	(entrada[15:0]),
		// Inputs
		.RCO		(RCO),
		.salida		(salida[15:0]));

endmodule
