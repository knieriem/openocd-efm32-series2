# Setup interface
. ./_iface.sh
# To run on xG23 targets, change below to 'target/efm32s2_g23.cfg'
./bin/openocd-efm32s2 -s scripts -f interface/$iface.cfg \
	-c 'transport select swd' \
	-f target/efm32s2.cfg\
	-c init \
	-c halt \
	-c 'flash probe 0' \
	-c 'flash banks' \
	-c 'flash list' \
	-c 'flash verify_image '$1' $FLASHBASE' \
	-c exit\
