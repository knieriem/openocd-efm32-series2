#!/bin/sh

. ./_conf.sh

./bin/openocd-efm32s2 -s scripts -f interface/$iface.cfg \
	-c 'transport select swd' \
	-f target/$target.cfg\
	-c init \
	-c halt \
