prefix=@P@/windows/libjaylink
exec_prefix=${prefix}
libdir=${prefix}/lib
includedir=${prefix}/include

Name: libjaylink
Description: Library to access J-Link devices
Version: 0.2.0
Requires.private: libusb-1.0
Libs: -L${libdir} -ljaylink
Cflags: -I${includedir}
