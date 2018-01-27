You need UCM files from https://github.com/plbossart/UCM/tree/master/bytcr-rt5640

follow instructions there

also hdmi might be messing with pulseaudio, so blacklist it

echo 'blacklist snd_hdmi_lpe_audio' >> /etc/modprobe.d/50-block-hdmi-audio.conf
