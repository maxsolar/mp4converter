#!/bin/bash
source $HOME/bin/envsetup.sh
check_requirements
type_checker $1 # decide suffix
ffmpeg -i $1 -vcodec libx264 -acodec aac -strict -2 -crf 24 $new_filename
#ffmpeg -i $1 -vcodec libx264 -crf 20 $new_filename
