set -e

# get libusb and hidapi DLLs from github.com/libusb:

rm -f hidapi-win.zip
wget https://github.com/libusb/hidapi/releases/download/hidapi-0.10.1/hidapi-win.zip
rm -rf hidapi
mkdir hidapi
cd hidapi
unzip ../hidapi-win.zip
cd ..

wget -O libusb.7z https://github.com/libusb/libusb/releases/download/v1.0.24/libusb-1.0.24.7z
rm -rf libusb
mkdir libusb
cd libusb
wget https://raw.githubusercontent.com/libusb/libusb/master/COPYING
7z x ../libusb.7z MinGW64
