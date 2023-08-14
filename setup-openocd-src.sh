set -e

openocd_rev=7c6d379

msg () {
	echo
	echo \* "$@"
}
cmd () {
	echo '	'"$@"
	"$@"
}

if test -d efm32s2; then :
else
	echo please run this script from the project root
	exit 2
fi

msg cloning OpenOCD\'s official Github mirror repository
cmd git clone -q https://github.com/openocd-org/openocd
cmd cd openocd

msg checking out a revision compatible to this EFM32 series 2 extension: $openocd_rev
cmd git checkout -q $openocd_rev

msg initializing sub modules
cmd git submodule -q init
cmd git submodule -q update

msg copying efm32s2 files to the OpenOCD source tree
cmd cp ../efm32s2/efm32s2.c src/flash/nor/
cmd cp ../efm32s2/efm32s2.cfg tcl/target/
cmd cp ../efm32s2/efm32s2_g23.cfg tcl/target/
cmd patch -p1 -i ../efm32s2/adjust_openocd.patch

cmd ./bootstrap

cat <<EOF

Finished setting up the OpenOCD source tree.
To build a minimal setup, run: sh build.sh
EOF
