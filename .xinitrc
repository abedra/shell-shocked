#exec ck-launch-session gnome-session
/usr/bin/vmware-user-suid-wrapper
xsetroot -cursor_name left_ptr
feh --bg-scale /home/abedra/Documents/Wallpaper/failure.jpg
xmobar &
exec ck-launch-session xmonad
