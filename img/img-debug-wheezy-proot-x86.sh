#!/bin/sh
DIR=dist-debug-wheezy-proot-x86/img
sudo rm -r -f $DIR
mkdir -p $DIR
APT_CACHER=
[ -e /etc/init.d/apt-cacher ] && APT_CACHER=/localhost:3142
sudo qemu-debootstrap --arch=i386 --verbose \
        --components=main,universe,restricted,multiverse \
        --include=`cat img-debug-wheezy.pkg` \
        wheezy $DIR http:/$APT_CACHER/ftp.ua.debian.org/debian/ \
&& sudo ./prepare-img-proot.sh --update-packages $DIR x86
