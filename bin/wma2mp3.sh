#!/bin/bash
source $HOME/bin/envsetup.sh
check_requirements lame
check_requirements mplayer
check_filename "$*"
check_suffix $tmp_filename # decide suffix
mplayer -vo null -vc dummy -af resample=44100 -ao pcm -ao pcm:waveheader $tmp_filename && lame -m s audiodump.wav -o $new_filename

rm audiodump.wav
