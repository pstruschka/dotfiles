source /etc/zsh/zprofile
#if type "cowfortune" > /dev/null; then
#  cowfortune
#fi

#. /etc/profile.d/vte.sh

#export TERM=xterm-256color

#export EDITOR="emacsclient -c"

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0

export MTP_NO_PROBE="1"

# fzf
if type "fzf" > /dev/null && type "rg" > /dev/null; then
    export FZF_DEFAULT_COMMAND="rg --hidden --follow --ignore-vcs --files --iglob '!.git'"
fi

# Aliases
alias open=xdg-open

