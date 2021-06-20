./bin/openocd-efm32s2 -s scripts -f interface/cmsis-dap.cfg \
	-f target/efm32s2.cfg\
	-c 'transport select swd' \
	-c init \
	-c halt \
	-c 'flash probe 0' \
	-c 'flash banks' \
	-c 'flash list' \
	-c 'flash write_image erase '$1 \
	-c exit\

