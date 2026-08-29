Iverilog and GTKWave simulations for Digital Electronics Concepts.<br>
---


To compile the files :<br>
iverilog -o sim.out testbench_file.v design_file.v<br>
---

We need to declare in which file does it store the simulation results <br>
example : file_name.vcd<br>
---

To simulate :<br>
vvp sim.out<br>
---

To get the wave in GTK Wave simulator:<br>
gtkwave file_name.vcd<br>
---

To dump the simulation values into a file :<br>
$dumpfile("file_name.vcd");<br>
---

To dump the variables into some file: <br>
$dumpfile(0,testbench);<br>
---