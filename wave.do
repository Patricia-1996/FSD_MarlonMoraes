onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color black /nanoCPU_TB/CPU/ck
add wave -noupdate -color black /nanoCPU_TB/CPU/rst
add wave -noupdate -divider memoria
add wave -noupdate -color black /nanoCPU_TB/CPU/we
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/address
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/dataR
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/dataW
add wave -noupdate -divider {estado e inst}
add wave -noupdate /nanoCPU_TB/CPU/EA
add wave -noupdate /nanoCPU_TB/CPU/inst
add wave -noupdate -divider {PC e IR}
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/IR
add wave -noupdate -radix hexadecimal /nanoCPU_TB/CPU/PC
add wave -noupdate -divider registradores
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[0]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[1]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[2]}
add wave -noupdate -radix hexadecimal {/nanoCPU_TB/CPU/reg_bank[3]}
add wave -noupdate -divider memoria
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(0)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(1)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(2)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(3)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(4)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(5)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(6)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(7)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(8)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(9)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(10)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(11)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(12)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(13)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(14)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(15)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(16)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(17)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(18)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(19)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(20)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(21)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(22)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(23)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(24)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(25)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(26)
add wave -noupdate -radix hexadecimal /nanoCPU_TB/memory(27)
WaveRestoreCursors {{Cursor 1} {819285 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {861 ns}
