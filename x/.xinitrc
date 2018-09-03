# set keyboard
setxkbmap -layout us,us -variant ,dvp -option grp:shifts_toggle

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#exec startxfce4
exec i3
