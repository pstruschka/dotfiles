#!/bin/sh

xprofile=${XDG_CONFIG_HOME}/X/xprofile
[ -f  $xprofile ] && . $xprofile

#exec startxfce4
exec i3
#exec bspwm
