if status is-interactive
    # Commands to run in interactive sessions can go here
    status is-interactive; and pyenv init --path | source
    pyenv init - | source
    set -x IDF_PATH ~/esp/esp-idf

    set fish_greeting
    ## set keyboard
    setxkbmap -model abnt2 -layout br -variant abnt2
end
