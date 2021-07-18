if status is-interactive
    # Commands to run in interactive sessions can go here
    status is-interactive; and pyenv init --path | source
    pyenv init - | source
    set -x IDF_PATH ~/esp/esp-idf
end
