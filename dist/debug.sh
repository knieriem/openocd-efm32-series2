./bin/openocd -s scripts -f interface/cmsis-dap.cfg \
	-f target/efm32s2.cfg\
	-c 'transport select swd' \
	-c 'init' \
	-c 'halt' \


