#!/system/bin/sh
# Enable Speakers
alsa_amixer -c0 sset 'DAC MIXL INF1' on
alsa_amixer -c0 sset 'DAC MIXR INF1' on
alsa_amixer -c0 sset 'Stereo DAC MIXL DAC L1' on
alsa_amixer -c0 sset 'Stereo DAC MIXR DAC R1' on
alsa_amixer -c0 sset 'SPK MIXL DAC L1' on
alsa_amixer -c0 sset 'SPK MIXR DAC R1' on
alsa_amixer -c0 sset 'SPOL MIX SPKVOL L' on
alsa_amixer -c0 sset 'SPOR MIX SPKVOL R' on
alsa_amixer -c0 sset 'Speaker' on
alsa_amixer -c0 sset 'Speaker Channel' on
alsa_amixer -c0 sset 'Speaker L' on
alsa_amixer -c0 sset 'Speaker R' on
alsa_amixer -c0 sset 'Speaker' 29

# Disable Headphones
alsa_amixer -c0 sset 'Headphone' off
alsa_amixer -c0 sset 'HP Channel' off
alsa_amixer -c0 sset 'HP L' off
alsa_amixer -c0 sset 'HP R' off
alsa_amixer -c0 sset 'HP' 0


