all: verilog clean

verilog:
	iverilog -o testbench.vvp testbench.v
	vvp testbench.vvp
	gtkwave testbench.vcd

clean:
	rm -f *.vcd *.vvp 

