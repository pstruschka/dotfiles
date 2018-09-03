cowfortune

. /etc/profile.d/vte.sh

export EDITOR=emacsclient

export DEFAULT_USER=peter

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=0

export MTP_NO_PROBE="1"

#export ANDROID_HOME=/home/peter/Android/Sdk
#export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH"

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

alias open=xdg-open

