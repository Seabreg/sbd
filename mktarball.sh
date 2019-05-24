#!/bin/sh

name="sbd"
version="`cat sbd.c | grep '$Id: sbd.c,v' | cut -d' ' -f3`"
files="sbd.c doexec.c pel.c aes.c sha1.c socket_code.h pel.h aes.h sha1.h sbd.h doexec_unix.h doexec_win32.h readwrite.h misc.h Makefile mktarball.sh README COPYING CHANGES binaries"

echo "[i] making tarball..."
mkdir $name-$version
tar --exclude=CVS -cf temporaryplace-$version.tar $files
tar -C $name-$version -xf temporaryplace-$version.tar
rm -f $name-$version.tar.gz
tar -czf $name-$version.tar.gz --numeric-owner $name-$version
rm -rf $name-$version
rm -rf temporaryplace-$version.tar
chmod 0644 $name-$version.tar.gz
echo "[i] done"

