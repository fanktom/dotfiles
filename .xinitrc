export LANG=en_US.UTF-8
xrdb -merge ~/.Xresources &
xbindkeys
xset -b
setxkbmap -layout us,de -option grp:caps_toggle

exec i3 -V >> ~/.i3.log 2>&1
