. ./_iface.sh
./bin/openocd-efm32s2 -s scripts -f interface/$iface.cfg \
	-c 'transport select swd' \
	-f target/efm32s2.cfg\
	-c init \
	-c halt \


