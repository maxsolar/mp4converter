function disable_bell() {
    echo "set visualbell" > ~/.vimrc
    sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc
}

function repoupdate() {
    sudo sh -c "for i in xenial xenial-updates xenial-security xenial-proposed xenial-backports; do
    echo deb http://tw.archive.ubuntu.com/ubuntu \$i main restricted universe multiverse
    done > /etc/apt/sources.list"
    sudo apt-get update
}

function check_requirements() {
   dpkg -l ffmpeg | grep ii 2>/dev/null >&2 || sudo apt-get install ffmpeg -y 
   dpkg -l libav-tools |grep ii 2>/dev/null >&2 || sudo apt-get install libav-tools -y
}

function type_checker() {
    if [ "${1##*.}" == "mp4" ]; then
        export suffix="_resized.mp4"
    elif [ "${1##*.}" == "flv" ]; then
        export suffix="_converted.mp4"
    else
        echo unknown type ."${1##*.}"; exit 1
    fi
    export new_filename="${1%.*}${suffix}"
}
