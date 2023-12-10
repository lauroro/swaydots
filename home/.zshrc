HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
zstyle :compinstall filename '/home/lauro/.zshrc'
autoload -Uz compinit
compinit


# Prompt
precmd() {
    if [ "$((++cmd_count))" -gt 1 ]; then
        echo
    fi
}

PROMPT='%B%F{yellow}%n %~%b%f 
 > '


# Alias
alias sw="dbus-run-session sway"
alias ls="ls --color"
