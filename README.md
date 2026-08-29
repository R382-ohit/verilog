Iverilog and GTKWave simulations for Digital Electronics Concepts.

To compile the files :
iverilog -o sim.out testbench_file.v design_file.v

We need to declare in which file does it store the simulation results 
example : file_name.vcd

To simulate :
vvp sim.out

To get the wave in GTK Wave simulator:
gtkwave file_name.vcd

To dump the simulation values into a file :
$dumpfile("file_name.vcd");

To dump the variables into some file:
$dumpfile(0,testbench);