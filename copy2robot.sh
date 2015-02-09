#!/bin/bash

. lib.sh.in

setc remote_user "root"
setc remote_host "192.168.7.2"
setc remote_dir "/opt/eeduro/"
setc tmpdir "/tmp/eeduro"

rm -rf $tmpdir
mkdir -p $tmpdir/bin
mkdir -p $tmpdir/lib

cp build-armhf/eeros/src/libeeros.so $tmpdir/lib
cp build-armhf/eeduro/delta/eeduro-delta $tmpdir/bin
cp build-armhf/eeduro/util/eeduro-ctrl $tmpdir/bin

cp build-armhf/eeduro/test/led $tmpdir/bin
cp build-armhf/eeduro/test/button $tmpdir/bin
cp build-armhf/eeduro/test/encoder $tmpdir/bin
cp build-armhf/eeduro/test/magnet $tmpdir/bin
cp build-armhf/eeduro/test/voltage $tmpdir/bin

scp -r $tmpdir/bin $tmpdir/lib $remote_user@$remote_host:$remote_dir
