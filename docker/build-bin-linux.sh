UID=`id -u`
GID=`id -g`
osarch=linux-amd64
scriptpfx=/p

docker run \
	--rm \
	-i -t \
	-u $UID:$GID \
	-v .:/build \
	--env osarch=$osarch \
	--env scriptpfx=$scriptpfx \
	\
	openocd-efm32s2-build \
	\
	/bin/sh -e -c '
		cd /build
		sh $scriptpfx/build.sh /p
		sh $scriptpfx/mkdist.sh /p
		mv dist openocd-efm32s2-$osarch
		tar czf openocd-efm32s2-$osarch.tar.gz openocd-efm32s2-$osarch
	'
