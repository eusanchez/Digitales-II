all: yosys no_delay delay

yosys:
	iverilog -o salida testbench.v
	vvp salida
	gtkwave testbench.vcd


no_delay:
	iverilog -o salida testbench.v
	vvp salida
	gtkwave testbench.vcd
	
delay:
	iverilog -o salida testbench2.v
	vvp salida
	gtkwave testbench_delay.vcd	
	





