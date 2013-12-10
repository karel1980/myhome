# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

alias alert='zenity --info --text "All done"'
function alert2() {
 (sleep 2; wmctrl -a Information -b add,above) & fortune -a|zenity --text-info
}

