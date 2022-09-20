r: testbench.v probador.v contador.v
	iverilog -o salida testbench.v
	vvp salida
	gtkwave testbench.vcd
	rm -rf salida testbench.vcd

t:
	echo '`timescale 1ns/1ns\n\n`include "module.v" \n`include "tester.v" \n\nmodule testbench; \n\n\twire CLK; \n\nmodule moduleINST(/*AUTOINST*/   \n);\n\ntester test16(/*AUTOINST*/   \n);\n\nendmodule' > testbench.v		

a:	
	emacs --batch  testbench.v -f verilog-batch-auto