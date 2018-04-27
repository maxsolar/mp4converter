#!/bin/bash
source $HOME/bin/envsetup.sh
check_requirements
type_checker $1 # decide suffix
avconv -i $1 -codec copy $new_filename
