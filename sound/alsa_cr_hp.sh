#!/system/bin/sh
# Enable Headphones
alsa_amixer -c0 sset 'DAC MIXL INF1' on
alsa_amixer -c0 sset 'DAC MIXR INF1' on
alsa_amixer -c0 sset 'Stereo DAC MIXL DAC L1' on
alsa_amixer -c0 sset 'Stereo DAC MIXR DAC R1' on
alsa_amixer -c0 sset 'HPO MIX HPVOL' on
alsa_amixer -c0 sset 'HP Channel' on
alsa_amixer -c0 sset 'Headphone' on
alsa_amixer -c0 sset 'HP L' on
alsa_amixer -c0 sset 'HP R' on
alsa_amixer -c0 sset 'HP' 29

# Disable Speakers
alsa_amixer -c0 sset 'Speaker' off
alsa_amixer -c0 sset 'Speaker Channel' off
alsa_amixer -c0 sset 'Speaker L' off
alsa_amixer -c0 sset 'Speaker R' off
alsa_amixer -c0 sset 'Speaker' 0

