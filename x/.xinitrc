# set keyboard
setxkbmap -layout us,us -variant ,dvp -option grp:shifts_toggle

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set display
systemctl --user import-environment DISPLAY

#exec startxfce4
exec i3
#exec bspwm
