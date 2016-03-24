#!/bin/bash

if [ ! -z $(cat /etc/issue | grep debian) ] ; then
apt-get install build-essential git ; fi

if [ ! -z $(uname -r | grep ARCH) ] ; then
  echo "There is an aur package! Continue?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) pacman -Syu base-devel git ;;
          No ) exit;;
      esac
  done
fi

git clone https://github.com/hadess/rtl8723bs.git
cp rtl8723bs /usr/src/rtl8723bs/1.0/build
cp dkms.conf /usr/src/rtl8723bs/1.0/build/dkms.conf
dkms add -m rtl8723bs -v 1.0
dkms build -m rtl8723bs -v 1.0 && dkms install -m rtl8723bs -v 1.0 || true
