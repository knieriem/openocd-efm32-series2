set -e

cd ..
p=`pwd`
cd windows

# dl downloads an archive containing a windows library
# args: destdir archiveType url checksum ...archiveSubpath
dl() {
	lib=$1
	atype=$2
	url=$3
	sum=$4
	shift 4

	a=,,arch.$atype
	wget -O $a $url

	# check integrity of downloaded archive
	echo $sum $a > ,,sha256sums
	sha256sum -c ,,sha256sums
	rm -f ,,sha256sums

	destdir=$lib
	rm -rf $destdir
	mkdir $destdir
	cd $destdir
	x$atype ../$a "$@"

	# adjust permissions
	find . -type d -exec chmod 755 {} +
	find . -type f -exec chmod 644 {} +
	find . -type f -name '*.dll' -exec chmod 755 {} +

	cd ..
	rm -f $a

	sed 's,@P@,'$p',' < pkgconfig/$lib.pc.tpl > pkgconfig/$lib.pc
}

xzip() {
	unzip "$@"
}

x7z() {
	7zr x "$@"
}


# get libusb and hidapi DLLs from github.com/libusb:

dl \
	./hidapi-libusb \
	zip \
	https://github.com/libusb/hidapi/releases/download/hidapi-0.10.1/hidapi-win.zip \
	87b2017a3060f6d032160c5f139a30baae38ab3a867439eb65abcfcc93b2ba06 \


dl \
	./libusb-1.0 \
	7z \
	https://github.com/libusb/libusb/releases/download/v1.0.24/libusb-1.0.24.7z\
	620cec4dbe4868202949294157da5adb75c9fbb4f04266146fc833eef85f90fb \
	MinGW64 include\

cd libusb-1.0
wget https://raw.githubusercontent.com/libusb/libusb/master/COPYING
