## Build for Windows on Linux

If building the openocd Linux executable succeeds,
i.e. all prerequisites are available,
building a Windows executable should be easy,
prodided the x86_64-w64-mingw32 compiler toolchain
is installed.

### Prerequisites

Run `setup-libs.sh` to download prebuilt libusb and hidapi DLLs from github.com/libusb
to subdirectories:

	sh setup-libs.sh

### Build

After setting up the sources, as explained in the top-level README, run

	sh build.sh

inside this _windows_ subdirectory.
On success, there should be an openocd binary in ../openocd/src.

An installation subdirectory _dist_ may be set up using

	sh mkdist.sh

This installs the executable, the hidapi.dll and required OpenOCD scripts
to that subdirectory, that also contains some example scripts to test the
driver.
