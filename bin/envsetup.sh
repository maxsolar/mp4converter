## for Windows Subsystem for Linux only
function disable_bell() {
    echo "set visualbell" > ~/.vimrc
    sudo sed -i 's/# set bell-style none/set bell-style none/' /etc/inputrc
}

function repoupdate() {
    RELEASE=$(lsb_release -sc)
    sudo sh -c "for i in $RELEASE $RELEASE-updates $RELEASE-security $RELEASE-proposed $RELEASE-backports; do
    echo deb http://tw.archive.ubuntu.com/ubuntu \$i main restricted universe multiverse
    done > /etc/apt/sources.list"
    sudo apt-get update
}

function check_requirements() {
   dpkg -l "$@" | grep ii 2>/dev/null >&2 || sudo apt-get install "$@" -y 
}

function check_filename() {
    echo processing "$1"...
    export tmp_filename=$(echo "$1"|sed 's/[, ]\+/_/g')
    original_filename_checksum=$(echo "$1"|md5sum| awk '{print $1}')
    tmp_filename_checksum=$(echo "$tmp_filename"|md5sum| awk '{print $1}')

    if [ "$original_filename_checksum" != "$tmp_filename_checksum" ]; then
       mv -v "$1" $tmp_filename
    else
       echo "$1" filename is OK.
    fi
}

function check_suffix() {
    if [ "${1##*.}" == "mp4" ]; then
        export suffix="_resized.mp4"
    elif [ "${1##*.}" == "flv" ]; then
        export suffix="_converted.mp4"
    elif [ "${1##*.}" == "wma" ]; then
        export suffix=".mp3"
    else
        echo unknown type ."${1##*.}"; exit 1
    fi
    export new_filename="${1%.*}${suffix}"
}
