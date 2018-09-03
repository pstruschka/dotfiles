# Created by newuser for 5.4.2
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle docker

fpath+=~/.zfunc
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen theme https://gist.github.com/pstruschka/c05686e6cf10e12471a3104e42e6366b.git agnoster_custom

antigen apply


if ! type "exa" > /dev/null; then
	echo exa Missing, using ls
else
	alias ls=exa
fi
eval $(thefuck --alias)


# python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

eval "$(fasd --init auto)"
