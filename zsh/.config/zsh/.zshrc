autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history

fpath+=$XDG_DATA_HOME/zsh/functions

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Completion
zmodload zsh/complist
autoload -Uz compinit
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz complist
setopt COMPLETE_ALIASES
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)

autoload -U +X bashcompinit && bashcompinit

# Keys
bindkey -e


# Dirstack
autoload -Uz add-zsh-hook

DIRSTACKFILE="$XDG_CACHE_HOME/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
    dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
    [[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
    print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='20'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
    if [[ -n $1 ]]; then
        dirs "$@"
    else
        dirs -v | head -10
    fi
}
compdef _dirs d

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

if type "kitty" > /dev/null; then
    # Completion for kitty
    kitty + complete setup zsh | source /dev/stdin

    alias kdiff="kitty +kitten diff"
    alias kicat="kitty +kitten icat"
    alias kunicode="kitty +kitten unicode_input"
    alias kpanel="kitty +kitten panel"
    alias khints="kitty +kitten hints"
    alias kclip="kitty +kitten clipboard"
fi


if type "exa" > /dev/null; then
    alias ls=exa
fi

if type "thefuck" > /dev/null; then
    eval $(thefuck --alias)
fi

if type "fasd" > /dev/null; then
    eval "$(fasd --init auto)"
fi

# fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# python virtualenvwrapper
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"
[[ -e /usr/bin/virtualenvwrapper_lazy.sh ]] && \
    source /usr/bin/virtualenvwrapper_lazy.sh

[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && \
    source /usr/share/doc/pkgfile/command-not-found.zsh

# Aliases
alias ec="emacsclient -c"

# Source plugins
source "$XDG_CONFIG_HOME/zsh/zsh_plugins.sh"

# Switch based on TERM
case "$TERM" in
    "dumb")
        PS1="> "
        return;;
    "linux")
        PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
        return;;
    *)
        source <(antibody bundle romkatv/powerlevel10k)
        [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
esac
