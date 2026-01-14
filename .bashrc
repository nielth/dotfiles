#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias grep='grep --color=auto'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# export TERM=screen-256color

alias pip='pip3'
alias dc='docker compose'
alias tf='terraform'
alias ls="eza --icons=always"
alias ..='cd ..'
alias tmux="TERM=xterm-256color tmux"

cd() {
  builtin cd "$@" && ls
}

# Show git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Reset
RESET="\[\e[0m\]"

# Catppuccin (RGB foreground colors)
ROSEWATER="\[\e[38;2;245;224;220m\]"
FLAMINGO="\[\e[38;2;242;205;205m\]"
PINK="\[\e[38;2;245;194;231m\]"
MAUVE="\[\e[38;2;203;166;247m\]"
RED="\[\e[38;2;243;139;168m\]"
MAROON="\[\e[38;2;235;160;172m\]"
PEACH="\[\e[38;2;250;179;135m\]"
YELLOW="\[\e[38;2;249;226;175m\]"
GREEN="\[\e[38;2;166;227;161m\]"
TEAL="\[\e[38;2;148;226;213m\]"
SKY="\[\e[38;2;137;220;235m\]"
SAPPHIRE="\[\e[38;2;116;199;236m\]"
BLUE="\[\e[38;2;137;180;250m\]"
LAVENDER="\[\e[38;2;180;190;254m\]"
TEXT="\[\e[38;2;205;214;244m\]"

# Colour of primary prompt
export PS1="${MAUVE}\u${RESET} \
${BLUE}\w${RESET}\
${GREEN}\$(parse_git_branch)${RESET}\
${TEXT} > "

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

neofetch

eval "$(fzf --bash)"

. "$HOME/.local/bin/env"
