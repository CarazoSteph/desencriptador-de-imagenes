transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/subtracter.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/sign_magnitud_to_complement.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/shiftR.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/shiftL.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/Operations.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/mux_9_1.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/multiplier.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/mod.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/FlagsM.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/division.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/complement_2.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/bitwise_xor.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/bitwise_or.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/bitwise_and.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/ALU.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/adder.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/instructionDecoder.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/registerBank.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/controlUnit.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/processor.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/mux21.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/armToALUAdapter.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/flipFlopD.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/branchingCondition.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/FlagHolder.sv}
vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/bitwise_not.sv}

vlog -sv -work work +incdir+C:/TEC/Segundo\ Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus {C:/TEC/Segundo Semestre/Taller/Proyecto/desencriptador-de-imagenes/ProyectoQuartus/processorTest.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  processorTest

add wave *
view structure
view signals
run -all
