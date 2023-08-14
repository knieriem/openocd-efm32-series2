FROM debian:bullseye-slim AS base

RUN apt-get update && apt-get install -y \
	make \
	autoconf \
	libtool \
	pkg-config \
	gcc \
	git \
	libusb-1.0-0-dev \
	libhidapi-dev \
	libftdi-dev \
	p7zip \
	\
	gcc-mingw-w64-x86-64 \
	mingw-w64-tools \
	wget \
	unzip \
	zip \
	\
&& rm -rf /var/lib/apt/lists/*

COPY . /p/

RUN cd /p && sh setup-openocd-src.sh

RUN cd /p/windows && sh setup-libs.sh
