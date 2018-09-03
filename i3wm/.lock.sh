#!/bin/bash
revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5

ffmpeg -loglevel quiet -y -f x11grab -video_size 1920x1080 -i $DISPLAY -i ~/.rick_lock.png -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w-400):(main_h-overlay_h-5)" -vframes 1 /tmp/screen.png

#scrot -d 1 /tmp/locking_screen.png
#convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
#convert -composite /tmp/screen_blur.png ~/.rick_lock.png -gravity South -geometry -20x1200 /tmp/screen.png
i3lock -eui /tmp/screen.png
revert
