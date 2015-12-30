#!/bin/sh

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
tar cfv linux.tar linux
cd linux

# Merge sound
git remote add sound git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
git fetch sound
git merge sound/topic/intel
# Merge Power Management
git remote add pmfixes git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
git fetch pmfixes
git merge pmfixes/linux-next
# Merge Intel ASoC
git remote add asoc git://git.kernel.org/pub/scm/linux/kernel/git/lrg/asoc.git
git fetch asoc
git merge asoc/master
#Thermal SoC:      https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git
#TI Thermal SoC:   https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/ti-soc-thermal.git
git apply ../patches/*
