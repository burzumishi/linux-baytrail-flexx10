#!/bin/sh
# Disable Headphones
amixer -c0 sset 'Headphone' off
amixer -c0 sset 'HP Channel' off
amixer -c0 sset 'HP L' off
amixer -c0 sset 'HP R' off
amixer -c0 sset 'HP' 0

# Disable Speakers
amixer -c0 sset 'Speaker' off
amixer -c0 sset 'Speaker Channel' off
amixer -c0 sset 'Speaker L' off
amixer -c0 sset 'Speaker R' off
amixer -c0 sset 'Speaker' 0

