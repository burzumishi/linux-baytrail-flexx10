git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
git remote add sound git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
git fetch sound
git merge sound/topic/intel
git apply ../patches/*
