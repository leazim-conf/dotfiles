PROMPT="%(?:%{$fg_bold[blue]%}╔══$fg_bold[magenta][$fg_bold[magenta]%]%c]"
PROMPT+='$(git_prompt_info)
%{$fg_bold[blue]%}╚══>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" $fg_bold[magenta]($fg_bold[white]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg_bold[magenta])"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg_bold[red] ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg_bold[green] ✔"
