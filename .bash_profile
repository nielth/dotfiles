#Run brew in bash apple silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# export TERM=screen-256color

cdl()
{
    if [ "$#" = 0 ]; then
        cd ~ && ls 
    elif [ -d "$@" ]; then
        cd "$@" && ls
    else
        echo "$@" directory not found!!!
    fi
}

alias cd='cdl'

alias ..='cd ..'
alias pip='pip3'
alias dc='docker compose'
alias tf='terraform'
alias ls="eza --icons=always"
alias tmux="TERM=xterm-256color tmux"

# Show git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Colour of primary prompt
# export PS1="\u \w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# export PS1="\[\033[31m\]\u\[\033[0m\] \[\033[93m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\033[31m\]\u\[\033[0m\] \[\033[93m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

neofetch

# On macOS / with Homebrew:
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

eval "$(fzf --bash)"

. "$HOME/.cargo/env"
