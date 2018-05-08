#!/bin/bash
source $HOME/bin/envsetup.sh
check_requirements ffmpeg
check_filename "$*"
check_suffix $tmp_filename # decide suffix
ffmpeg -i $tmp_filename -vcodec libx264 -acodec aac -strict -2 -crf 24 $new_filename
