set -e

toolchain=x86_64-w64-mingw32

p=$1
if test "x$p" = x; then
	p=..
	cd $p/openocd
	srcdir=.
else
	srcdir=$p/openocd
	if test `ls -a | wc -l` = 2; then :
	else
		echo "build directory not empty"
		exit 2
	fi
fi

# make $p absolute
wd=`pwd`
cd $p
p=`pwd`
cd $wd

PKG_CONFIG_PATH=$p/windows/pkgconfig

export \
	PKG_CONFIG_PATH\

$srcdir/configure \
	--host=$toolchain \
	--without-capstone\
	--disable-presto\
	--enable-cmsis-dap\
	--enable-jlink\
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
	\
	--disable-ssl\

make clean
make
