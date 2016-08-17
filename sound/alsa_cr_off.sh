#!/system/bin/sh
# Disable Headphones
alsa_amixer -c0 sset 'Headphone' off
alsa_amixer -c0 sset 'HP Channel' off
alsa_amixer -c0 sset 'HP L' off
alsa_amixer -c0 sset 'HP R' off
alsa_amixer -c0 sset 'HP' 0

# Disable Speakers
alsa_amixer -c0 sset 'Speaker' off
alsa_amixer -c0 sset 'Speaker Channel' off
alsa_amixer -c0 sset 'Speaker L' off
alsa_amixer -c0 sset 'Speaker R' off
alsa_amixer -c0 sset 'Speaker' 0

