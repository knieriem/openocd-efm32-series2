set -e
cd openocd
./bootstrap
./configure \
	--prefix=/opt/openocd-emf32s2-cmsis-dap\
	--disable-presto\
	--disable-ftdi\
	--disable-stlink\
	--disable-rshim\
	--disable-usb-blaster-2\
	--disable-ti-icdi\
	--disable-vsllink\
	--disable-ft232r\
	--disable-xds110\
	--disable-osbdm\
	--disable-opendous\
	--disable-armjtagew\
	--disable-rlink\
	--disable-usbprog\
	--disable-aice\
	--disable-nulink\
	--disable-kitprog\
	--disable-buspirate\
	--disable-parport\
	--disable-parport-ppdev\
	--disable-amtjtagaccel\
	--disable-openjtag\
	--disable-usb-blaster\
	--disable-remote-bitbang\
	--disable-xlnx-pcie-xvc\
	--disable-gw16012\
	--disable-at91rm9200\
	--disable-ep93xx\
	--disable-imx_gpio\
	--disable-bcm2835gpio\

make
cd ..
