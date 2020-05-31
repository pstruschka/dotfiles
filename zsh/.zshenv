export EDITOR="nvim"

export DEFAULT_USER=peter


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

extra_paths=""

# RUST XDG_DIR
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
extra_paths="$CARGO_HOME/bin:$extra_paths"

# GOPATH
export GOPATH="$XDG_DATA_HOME/go"
extra_paths="$extra_paths:$GOPATH/bin"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
extra_paths="$extra_paths:$GEM_HOME/bin"

# Node & NPM
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export npm_config_prefix="$XDG_DATA_HOME/node"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
extra_paths="$extra_paths:$npm_config_prefix/bin"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# Other
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache.conf"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gkt-2.0/gtkrc"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NMBGIT="$XDG_DATA_HOME/notmuch/nmbug"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

[ -d "$HOME/bin" ] && \
    PATH="$HOME/bin:$PATH"
[ -d "$HOME/.bin" ] && \
    PATH="$HOME/.bin:$PATH"
[ -d "$HOME/.local/bin" ] && \
    PATH="$HOME/.local/bin:$PATH"
export PATH="$extra_paths:$PATH"

