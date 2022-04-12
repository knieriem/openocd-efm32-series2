set -e
cd ../openocd
toolchain=x86_64-w64-mingw32
./bootstrap
./configure --host=$toolchain \
	--without-capstone\
	--disable-presto\
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

make clean

# Make will fail when trying to link the openocd executable,
# since the linker does not find hidapi and libusb libraries in
# the expected locations.
# Because we have already downloaded prebuilt hidapi and libusb
# libraries to paths below this directory,
# we just rerun the linking step, using the correct library paths,
# to finally get the executable.
if ! make; then

	$toolchain-gcc -Wall -Wstrict-prototypes -Wformat-security -Wshadow -Wextra -Wno-unused-parameter -Wbad-function-cast -Wcast-align -Wredundant-decls -Wpointer-arith -Wundef -Werror -g -O2 -o src/openocd.exe src/main.o  src/.libs/libopenocd.a ../windows/hidapi/x64/hidapi.lib ../windows/libusb/MinGW64/static/libusb-1.0.a -lws2_32 ./jimtcl/libjim.a

fi
