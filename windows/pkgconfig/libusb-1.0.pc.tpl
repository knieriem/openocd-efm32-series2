prefix=@P@/windows/libusb-1.0
exec_prefix=${prefix}
libdir=${prefix}/MinGW64/static
includedir=${prefix}/include

Name: libusb-1.0
Description: C API for USB device access from Linux, Mac OS X, Windows, OpenBSD/NetBSD and Solaris userspace
Version: 1.0.24
Libs: -L${libdir} -lusb-1.0
Cflags: -I${includedir}/libusb-1.0
