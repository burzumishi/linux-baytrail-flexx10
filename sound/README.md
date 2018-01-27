You need UCM files from https://github.com/plbossart/UCM/tree/master/bytcr-rt5640

follow instructions there (notice the bytcr-rt5640 folder - that is what you need)

also hdmi might be messing with pulseaudio, so blacklist it (but it might not :P - please test it for your device)

echo 'blacklist snd_hdmi_lpe_audio' >> /etc/modprobe.d/50-block-hdmi-audio.conf
