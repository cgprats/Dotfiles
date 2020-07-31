xrdb -load ~/.Xresources
feh --bg-scale ~/.config/backgrounds/bg.png
compton &
polybar example &
sxhkd -m 1 &
exec bspwm
