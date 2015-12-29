#!/bin/sh

apt-get install build-essential git
git clone https://github.com/hadess/rtl8723bs.git
cd rtl8723bs 
make
make install
depmod -a
modprobe r8723bs
