#!/bin/bash
source $HOME/bin/envsetup.sh
check_requirements ffmpeg
check_filename "$*"
check_suffix $tmp_filename # decide suffix
ffmpeg -i $tmp_filename -codec copy $new_filename
