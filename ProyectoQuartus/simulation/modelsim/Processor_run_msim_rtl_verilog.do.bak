transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/instructionMemory.v}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/instructionMemoryProgramCounter.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/genericCounter.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre\ 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre 2022/taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/instructionManager.sv}

