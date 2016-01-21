#DSP routing
amixer -c0 sset 'codec_out0 mix 0 pcm0_in' on
amixer -c0 sset 'media0_out mix 0 media1_in' on
amixer -c0 sset 'media1_in Gain 0' 80% 
amixer -c0 sset 'media1_in Gain 0 Ramp Delay' 50
amixer -c0 sset 'media1_in Gain 0' off
amixer -c0 sset 'pcm0_in Gain 0' 80% 
amixer -c0 sset 'pcm0_in Gain 0 Ramp Delay' 50
amixer -c0 sset 'pcm0_in Gain 0' off
amixer -c0 sset 'codec_out0 Gain 0' 80%
amixer -c0 sset 'codec_out0 Gain 0 Ramp Delay' 50
amixer -c0 sset 'codec_out0 Gain 0' off

#Codec routin, if you have different one please modfiy
amixer -c0 sset "DAC MIXL INF1" on
amixer -c0 sset "DAC MIXR INF1" on
amixer -c0 sset "Stereo DAC MIXL DAC L1" on
amixer -c0 sset "Stereo DAC MIXR DAC R1" on
amixer -c0 sset "SPK MIXL DAC L1" on
amixer -c0 sset "SPK MIXR DAC R1" on
amixer -c0 sset "SPOL MIX SPKVOL L" on
amixer -c0 sset "SPOR MIX SPKVOL R" on
amixer -c0 sset "SPOL MIX DAC L1" on
amixer -c0 sset "SPOR MIX DAC R1" on
amixer -c0 sset "Speaker L" on
amixer -c0 sset "Speaker R" on
amixer -c0 sset "Headphone" off
amixer -c0 sset "Ext Spk" on
