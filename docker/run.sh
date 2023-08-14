UID=`id -u`
GID=`id -g`

docker run \
	--rm \
	-i -t \
	-u $UID:$GID \
	-v .:/build \
	-w /build \
	\
	openocd-efm32s2-build \
	/bin/bash \
