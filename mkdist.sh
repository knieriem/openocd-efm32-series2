set -e

p=$1
if test "x$p" = x; then
	p=..
	src=$p/openocd
	builddir=$src
else
	# make $p absolute
	wd=`pwd`
	cd $p
	p=`pwd`
	cd $wd

	cp -a $p/dist .
	src=$p/openocd
	builddir=..
fi

cd dist

cp -a $src/LICENSES .
cp $src/COPYING .

mkdir -p bin
cp $builddir/src/openocd bin/openocd-efm32s2
strip -s bin/openocd-efm32s2

mkdir -p scripts/interface
cp $src/tcl/interface/cmsis-dap.cfg scripts/interface
cp $src/tcl/interface/jlink.cfg scripts/interface

mkdir -p scripts/target
cp $src/tcl/target/efm32s2.cfg scripts/target
cp $src/tcl/target/efm32s2_g23.cfg scripts/target
cp $src/tcl/target/swj-dp.tcl scripts/target
