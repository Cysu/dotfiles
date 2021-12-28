xset r rate 200 60

alias dush="du -sm * | sort -h"
alias pa="ps aux | grep"
alias nv='watch -n 0.1 nvidia-smi'
alias path='readlink -f'
alias cs='find . -type f | xargs grep'

export PYTHONPATH=".:$PYTHONPATH"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

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

