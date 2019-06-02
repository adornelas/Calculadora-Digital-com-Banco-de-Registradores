onerror {quit -f}
vlib work
vlog -work work Pre-Projeto.vo
vlog -work work Pre-Projeto.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Pre-Projeto_vlg_vec_tst
vcd file -direction Pre-Projeto.msim.vcd
vcd add -internal Pre-Projeto_vlg_vec_tst/*
vcd add -internal Pre-Projeto_vlg_vec_tst/i1/*
add wave /*
run -all
