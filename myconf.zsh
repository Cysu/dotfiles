alias l="ls -l"
alias ll="ls -al"
alias lx="ls -al"
alias dush="du -sm * | sort -h"
alias pa="ps aux | grep"
alias nv='watch -n 0.1 nvidia-smi'
alias path='greadlink -f'
alias cs='find . -type f | xargs grep'

alias brew_update='brew update && brew upgrade && brew cu --all && brew cu --cleanup && brew cleanup'

export PYTHONPATH=".:$PYTHONPATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


function howmany() {
    if [[ $# -eq 1 ]]; then
        local ext=$1
        find . -name "*.${ext}" | wc -l
    else
        find . -type f | wc -l
    fi
}

function json_beautify() {
    local fin=$1
    if [[ $# -eq 1 ]]; then
        cat ${fin} | jq .
    else
        local fout=$2
        cat ${fin} | jq . > ${fout}
    fi
}

function venv_create() {
    python3 -m venv $1
}

function venv_activate() {
    source $1/bin/activate
}

function gif() {
    local input_video=$1
    local save_path=$2
    local height=$3
    local fps=30

    ffmpeg -y -i ${input_video} -vf fps=${fps},scale=-1:${height}:flags=lanczos,palettegen palette.png
    ffmpeg -i ${input_video} -i palette.png -filter_complex "fps=${fps},scale=-1:${height}:flags=lanczos[x];[x][1:v]paletteuse" ${save_path}
}

