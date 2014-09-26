#!/bin/bash

tmpdir="/tmp/eeduro"

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

scp -r $tmpdir/bin $tmpdir/lib root@192.168.7.2:/opt/eeduro-0.3/
