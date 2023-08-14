UID=`id -u`
GID=`id -g`
osarch=windows-amd64
scriptpfx=/p/windows

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
		cd dist
		zip -r ../openocd-efm32s2-$osarch.zip .
	'
