. ./_iface.sh
./bin/openocd-efm32s2 -s scripts -f interface/$iface.cfg \
	-c 'transport select swd' \
	-f target/efm32s2.cfg\
	-c init \
	-c halt \
	-c 'flash probe 0' \
	-c 'flash banks' \
	-c 'flash list' \
	-c 'flash verify_image '$1 \
	-c exit\

