#!/bin/sh
# Enable Headphones
amixer -c0 sset 'DAC MIXL INF1' on
amixer -c0 sset 'DAC MIXR INF1' on
amixer -c0 sset 'Stereo DAC MIXL DAC L1' on
amixer -c0 sset 'Stereo DAC MIXR DAC R1' on
amixer -c0 sset 'HPO MIX HPVOL' on
amixer -c0 sset 'HP Channel' on
amixer -c0 sset 'Headphone' on
amixer -c0 sset 'HP L' on
amixer -c0 sset 'HP R' on
amixer -c0 sset 'HP' 29

# Disable Speakers
amixer -c0 sset 'Speaker' off
amixer -c0 sset 'Speaker Channel' off
amixer -c0 sset 'Speaker L' off
amixer -c0 sset 'Speaker R' off
amixer -c0 sset 'Speaker' 0

