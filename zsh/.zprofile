source /etc/zsh/zprofile
#if type "cowfortune" > /dev/null; then
#  cowfortune
#fi

#. /etc/profile.d/vte.sh

#export TERM=xterm-256color

#export EDITOR="emacsclient -c"
export EDITOR="nvim"

export DEFAULT_USER=peter

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0

export MTP_NO_PROBE="1"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"

# Android SDK
if [ -d "$HOME/.local/share/android-sdk" ]; then
  export ANDROID_HOME="$HOME/.local/share/android-sdk"
  export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH"
fi

# bin
export PATH="$HOME/.bin:$PATH"

# Go
if type "go" > /dev/null; then
  export PATH="$HOME/go/bin:$PATH"
  export GOPATH=$(go env GOPATH)
fi

# Rust
if type "rustc" > /dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# Node
if type "npm" > /dev/null; then
  export PATH="$HOME/.node_modules/bin:$PATH"
  export npm_config_prefix=~/.node_modules
fi

# Ruby
if type "ruby" > /dev/null; then
  export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

# fzf
if type "fzf" > /dev/null && type "rg" > /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --hidden --follow --ignore-vcs --files --iglob '\!.git'"
fi

# Aliases
alias open=xdg-open

