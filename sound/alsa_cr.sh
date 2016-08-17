#!/system/bin/sh
# media mixer settings
#   compress
alsa_amixer -c0 sset "media0_in Gain 0" on
alsa_amixer -c0 sset "media0_in Gain 0" 0

#   normal
alsa_amixer -c0 sset "media1_in Gain 0" on
alsa_amixer -c0 sset "media1_in Gain 0" 0
#  swm loopback
alsa_amixer -c0 sset "media2_in Gain 0" off
alsa_amixer -c0 sset "media2_in Gain 0" 0%
#   deep buffer
alsa_amixer -c0 sset "media3_in Gain 0" on
alsa_amixer -c0 sset "media3_in Gain 0" 0

alsa_amixer -c0 sset "media0_out mix 0 media0_in" on
alsa_amixer -c0 sset "media0_out mix 0 media1_in" on
alsa_amixer -c0 sset "media0_out mix 0 media2_in" off
alsa_amixer -c0 sset "media0_out mix 0 media3_in" on

alsa_amixer -c0 sset "media1_out mix 0 media0_in" off
alsa_amixer -c0 sset "media1_out mix 0 media1_in" off
alsa_amixer -c0 sset "media1_out mix 0 media2_in" off
alsa_amixer -c0 sset "media1_out mix 0 media3_in" off

alsa_amixer -c0 sset "pcm0_in Gain 0" on
alsa_amixer -c0 sset "pcm0_in Gain 0" 0

alsa_amixer -c0 sset "pcm1_in Gain 0" off
alsa_amixer -c0 sset "pcm1_in Gain 0" 0%

# codec0_out settings
alsa_amixer -c0 sset "codec_out0 mix 0 codec_in0" off
alsa_amixer -c0 sset "codec_out0 mix 0 codec_in1" off
alsa_amixer -c0 sset "codec_out0 mix 0 media_loop1_in" off
alsa_amixer -c0 sset "codec_out0 mix 0 media_loop2_in" off
alsa_amixer -c0 sset "codec_out0 mix 0 pcm0_in" on
alsa_amixer -c0 sset "codec_out0 mix 0 pcm1_in" off
alsa_amixer -c0 sset "codec_out0 mix 0 sprot_loop_in" off
alsa_amixer -c0 sset "codec_out0 Gain 0" on
alsa_amixer -c0 sset "codec_out0 Gain 0" 0

# input settings
# pcm1_out settings

alsa_amixer -c0 sset "codec_in0 Gain 0" on
alsa_amixer -c0 sset "codec_in0 Gain 0" 0

alsa_amixer -c0 sset "pcm1_out mix 0 codec_in0" on
alsa_amixer -c0 sset "pcm1_out mix 0 codec_in1" off
alsa_amixer -c0 sset "pcm1_out mix 0 media_loop1_in" off
alsa_amixer -c0 sset "pcm1_out mix 0 media_loop2_in" off
alsa_amixer -c0 sset "pcm1_out mix 0 pcm0_in" off
alsa_amixer -c0 sset "pcm1_out mix 0 pcm1_in" off
alsa_amixer -c0 sset "pcm1_out mix 0 sprot_loop_in" off

alsa_amixer -c0 sset "pcm1_out Gain 0" on
alsa_amixer -c0 sset "pcm1_out Gain 0" 0

# disable codec_out1
alsa_amixer -c0 sset "codec_out1 mix 0 codec_in0" off
alsa_amixer -c0 sset "codec_out1 mix 0 codec_in1" off
alsa_amixer -c0 sset "codec_out1 mix 0 media_loop1_in" off
alsa_amixer -c0 sset "codec_out1 mix 0 media_loop2_in" off
alsa_amixer -c0 sset "codec_out1 mix 0 pcm0_in" off
alsa_amixer -c0 sset "codec_out1 mix 0 pcm1_in" off
alsa_amixer -c0 sset "codec_out1 mix 0 sprot_loop_in" off
alsa_amixer -c0 sset "codec_out1 Gain 0" off
alsa_amixer -c0 sset "codec_out1 Gain 0" 0%

# disable codec_in1
alsa_amixer -c0 sset "codec_in1 Gain 0" off
alsa_amixer -c0 sset "codec_in1 Gain 0" 0%

# disable all loops
alsa_amixer -c0 sset "media_loop1_out mix 0 codec_in0" off
alsa_amixer -c0 sset "media_loop1_out mix 0 codec_in1" off
alsa_amixer -c0 sset "media_loop1_out mix 0 media_loop1_in" off
alsa_amixer -c0 sset "media_loop1_out mix 0 media_loop2_in" off
alsa_amixer -c0 sset "media_loop1_out mix 0 pcm0_in" off
alsa_amixer -c0 sset "media_loop1_out mix 0 pcm1_in" off
alsa_amixer -c0 sset "media_loop1_out mix 0 sprot_loop_in" off

alsa_amixer -c0 sset "media_loop2_out mix 0 codec_in0" off
alsa_amixer -c0 sset "media_loop2_out mix 0 codec_in1" off
alsa_amixer -c0 sset "media_loop2_out mix 0 media_loop1_in" off
alsa_amixer -c0 sset "media_loop2_out mix 0 media_loop2_in" off
alsa_amixer -c0 sset "media_loop2_out mix 0 pcm0_in" off
alsa_amixer -c0 sset "media_loop2_out mix 0 pcm1_in" off
alsa_amixer -c0 sset "media_loop2_out mix 0 sprot_loop_in" off

alsa_amixer -c0 sset "sprot_loop_out mix 0 codec_in0" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 codec_in1" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 media_loop1_in" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 media_loop2_in" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 pcm0_in" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 pcm1_in" off
alsa_amixer -c0 sset "sprot_loop_out mix 0 sprot_loop_in" off

# RT5640 default output routing
alsa_amixer -c0 sset "OUT MIXL DAC L1"  on
alsa_amixer -c0 sset "OUT MIXR DAC R1"  on
