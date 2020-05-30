# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# zplug
source ~/.zplug/init.zsh

# oh my zsh stuff

zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/taskwarrior", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/virtualenvwrapper", from:oh-my-zsh
zplug "plugins/zsh-navigation-tools", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

# THEME
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context virtualenv dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

# zplug theme https://gist.github.com/pstruschka/c05686e6cf10e12471a3104e42e6366b.git agnoster_custom

#[ "$TERM" = "linux" ] || zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
case "$TERM" in
    "linux") ;;
    "dumb") export PS1="> ";;
    *) zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
esac

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

fpath+=$XDG_DATA_DIR/zsh/functions

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

[ -n $ZSH ] && [ -e $ZSH/oh-my-zsh.sh ] && \
    source $ZSH/oh-my-zsh.sh

if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

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

# python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
[[ -e /usr/bin/virtualenvwrapper_lazy.sh ]] && \
    source /usr/bin/virtualenvwrapper_lazy.sh

alias ec="emacsclient -c"

[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && \
    source /usr/share/doc/pkgfile/command-not-found.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
