set -e
cd dist
src=../../openocd
toolchain=x86_64-w64-mingw32

cp -a $src/LICENSES .
cp $src/COPYING .

mkdir -p bin
cp $src/src/openocd.exe bin/openocd-efm32s2.exe
$toolchain-strip -s bin/openocd-efm32s2.exe

mkdir -p scripts/interface
cp $src/tcl/interface/cmsis-dap.cfg scripts/interface

mkdir -p scripts/target
cp $src/tcl/target/efm32s2.cfg scripts/target
cp $src/tcl/target/swj-dp.tcl scripts/target

cp ../hidapi/x64/hidapi.dll bin/
cp ../libusb/COPYING  COPYING.libusb
