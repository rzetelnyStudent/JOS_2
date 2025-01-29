del -f Alu_tb.vvp
del -f Alu_tb.vcd


iverilog -Wall -g2012 -s Alu_tb -o Alu_tb.vvp Alu_tb.sv Alu.sv alu_acc_flags.sv alu_in_mux.sv acc.sv
if ERRORLEVEL 1 goto ON_ERROR

vvp Alu_tb.vvp
if ERRORLEVEL 1 goto ON_ERROR
gtkwave Alu_tb.gtkw

goto SIM_EXIT

:ON_ERROR
echo Terminating on error.

:SIM_EXIT

