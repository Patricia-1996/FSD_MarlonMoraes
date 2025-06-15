if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vlog nanoCPU.sv
vlog nanoTB.sv

vsim -voptargs=+acc=lprn -t ps work.nanoCPU_TB

do wave.do

run 820  ns

