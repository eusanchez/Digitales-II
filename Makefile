r: testbench16.v tester16.v contador16.v contador.v
	iverilog -o salida testbench16.v
	vvp salida
	gtkwave resultados.vcd
	rm -rf salida resultados.vcd

t:
	echo '`timescale 1ns/1ns\n\n`include "module.v" \n`include "tester.v" \n\nmodule testbench; \n\n\twire CLK; \n\nmodule moduleINST(/*AUTOINST*/   \n);\n\ntester testerINST(/*AUTOINST*/   \n);\n\nendmodule' > testbench16.v		

a:	
	emacs --batch  testbench16.v -f verilog-batch-auto
	
s: 
	echo '# read design\nread_verilog module.v\n#hierarchy -check -top counter\n# the high-level stuff\nproc; opt; fsm; opt; memory; opt\n# mapping to internal cell library\ntechmap; opt\n# mapping flip-flops to cmos_cells.lib\ndfflibmap -liberty cmos_cells.lib\n# mapping logic to cmos_cells.lib\nabc -liberty cmos_cells.lib\n# cleanup\nclean\n# show\nshow -lib cmos_cells.v\n# write synsthesized design\nwrite_verilog moduleS.v\n' > synthesis_module.ys
	
s1:	synthesis_parametrizado.ys
	yosys -s synthesis_parametrizado.ys
	sed -i 's/module parametrizado/module parametrizadoS/' parametrizadoS.v
	sed -i 's/module mux/module muxS/' parametrizadoS.v

s2:	synthesis_fsm.ys
	yosys -s synthesis_fsm.ys
	sed -i 's/module fsm/module fsmS/' fsmS.v
