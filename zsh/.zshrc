source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-extras
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle docker
antigen bundle archlinux
antigen bundle sublime
antigen bundle zsh-navigation-tools
antigen bundle systemd
antigen bundle taskwarrior
antigen bundle virtualenvwrapper

fpath+=~/.zfunc
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search


# THEME
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context virtualenv dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)

# antigen theme https://gist.github.com/pstruschka/c05686e6cf10e12471a3104e42e6366b.git agnoster_custom
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply


if type "kitty" > /dev/null; then
	autoload -Uz compinit
	compinit
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


# python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

alias ec="emacsclient -c"

eval "$(fasd --init auto)"
