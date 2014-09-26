#!/bin/bash

eeros_branch="0.3.x"
eeduro_branch="develop"

missing_packages=0

function create_build_dir()
{
	if [ ! -d $1 ]; then
		mkdir $1
		pushd $1
		shift
		cmake .. $@
		popd
	fi
}

function check_package()
{
	dpkg-query -W $1 >/dev/null
	if [ "$?" != "0" ]; then
		echo "$1 not installed"
		((missing_packages++))
	fi
}


if [ ! -d eeros ]; then
	git clone git://github.com/eeros-project/eeros-framework.git eeros -o upstream -b $eeros_branch
fi

if [ ! -d eeduro ]; then
	git clone git://github.com/eeros-project/eeduro-platform.git eeduro -o upstream -b $eeduro_branch
fi

if [ ! -d linaro-tc ]; then
	wget -c https://launchpad.net/linaro-toolchain-binaries/trunk/2013.03/+download/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
	echo extracting...
	tar xjf gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
	rm gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux.tar.bz2
	mv gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux linaro-tc
	cp toolchain.cmake linaro-tc/
fi

check_package libc6:i386
check_package libstdc++6:i386
check_package libncurses5:i386
check_package zlib1g:i386

if [ $missing_packages -gt 0 ]; then
	echo "install missing packages and run this script again"
	exit 1
fi

create_build_dir build-x86-64
create_build_dir build-armhf -DCMAKE_TOOLCHAIN_FILE=../linaro-tc/toolchain.cmake
