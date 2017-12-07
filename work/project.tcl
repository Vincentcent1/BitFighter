set projDir "C:/Users/1002413/Desktop/LEDMatrix2/work/planAhead"
set projName "LEDMatrix"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/mojo_top_0.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/dataPathAlu_1.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/reset_conditioner_2.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/edge_detector_3.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/counter_4.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/buttonSelect_5.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/convertALUFN_6.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/displayModule_7.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/healthbar_8.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/prng_9.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/prng2_10.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/modulus_11.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/alu_12.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/button_conditioner_13.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/button_conditioner_13.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/button_conditioner_13.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/button_conditioner_13.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/ledMatrix_17.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/adder_23.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/boolean[1]_24.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/compare[1]_25.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/shifter[1]_26.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/multiplier_27.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/divider_28.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/pipeline_29.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/pipeline_29.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/pipeline_29.v" "C:/Users/1002413/Desktop/LEDMatrix2/work/verilog/pipeline_29.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/1002413/Desktop/LEDMatrix2/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
