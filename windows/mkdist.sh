set -e

p=$1
if test "x$p" = x; then
	p=../..
	src=$p/openocd
	builddir=$src
else
	# make $p absolute
	wd=`pwd`
	cd $p
	p=`pwd`
	cd $wd

	cp -a $p/windows/dist .
	src=$p/openocd
	builddir=..
fi

cd dist

toolchain=x86_64-w64-mingw32

cp -a $src/LICENSES .
cp $src/COPYING .

mkdir -p bin
cp $builddir/src/openocd.exe bin/openocd-efm32s2.exe
$toolchain-strip -s bin/openocd-efm32s2.exe

mkdir -p scripts/interface
cp $src/tcl/interface/cmsis-dap.cfg scripts/interface
cp ../../dist/scripts/interface/ftdi_ft232h.cfg scripts/interface

mkdir -p scripts/target
cp $src/tcl/target/efm32s2.cfg scripts/target
cp $src/tcl/target/swj-dp.tcl scripts/target

cp $p/windows/hidapi-libusb/x64/hidapi.dll bin/
cp $p/windows/libusb-1.0/COPYING  COPYING.libusb
