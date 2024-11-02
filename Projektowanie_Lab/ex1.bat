del -f Processor_tb
del -f Processor_tb.vcd


iverilog -Wall -s Processor_tb -o Processor_tb ALU.v ID.v OpCodes.v PC.v Processor.v RF.v ROM.v Processor_tb.v
if ERRORLEVEL 1 goto ON_ERROR

vvp Processor_tb
if ERRORLEVEL 1 goto ON_ERROR
gtkwave Processor_tb.vcd

goto SIM_EXIT

:ON_ERROR
echo Terminating on error.

:SIM_EXIT

