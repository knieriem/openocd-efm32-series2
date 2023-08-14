prefix=@P@/windows/hidapi-libusb
exec_prefix=${prefix}
libdir=${prefix}/x64
includedir=/usr/include

Name: hidapi-libusb
Description: C Library for USB HID device access from Linux, Mac OS X, FreeBSD, and Windows. This is the libusb implementation.
Version: 0.10.1
Libs: -L${libdir} -lhidapi
Cflags: -I${includedir}/hidapi
