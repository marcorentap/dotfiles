PROMPT="%{$fg_bold[cyan]%}%c%{$reset_color%}"
PROMPT+='$(git_prompt_info)'
PROMPT+=" %(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{177}::"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
