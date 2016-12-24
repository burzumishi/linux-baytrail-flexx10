#!/bin/sh
# Enable Speakers
amixer -c0 sset 'DAC MIXL INF1' on
amixer -c0 sset 'DAC MIXR INF1' on
amixer -c0 sset 'Stereo DAC MIXL DAC L1' on
amixer -c0 sset 'Stereo DAC MIXR DAC R1' on
amixer -c0 sset 'SPK MIXL DAC L1' on
amixer -c0 sset 'SPK MIXR DAC R1' on
amixer -c0 sset 'SPOL MIX SPKVOL L' on
amixer -c0 sset 'SPOR MIX SPKVOL R' on
amixer -c0 sset 'Speaker' on
amixer -c0 sset 'Speaker Channel' on
amixer -c0 sset 'Speaker L' on
amixer -c0 sset 'Speaker R' on
amixer -c0 sset 'Speaker' 29

# Disable Headphones
amixer -c0 sset 'Headphone' off
amixer -c0 sset 'HP Channel' off
amixer -c0 sset 'HP L' off
amixer -c0 sset 'HP R' off
amixer -c0 sset 'HP' 0


