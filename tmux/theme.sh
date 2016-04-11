color_white="white"
color_light="colour11"
color_midgrey="colour19"
color_darkgrey="colour18"
status_separator=" "
icon="👻 "
host="#h"
battery_icon="🔋 "
battery_status="#{battery_percentage} #{battery_remain}"
date="%d. %h - %H:%M"

# Set default statusbar color
set-option -g status-bg $color_midgrey

tm_status_left="$status_separator$icon [ Session: #S ]$status_separator"
tm_status_right="[ $host ] [ $battery_icon $battery_status ] [ $date ]$status_separator"

# Set the length of the left and right status lines
set -g status-left-length 40
set -g status-right-length 150

# Set appearance of left and right status line
set -g status-left $tm_status_left
set -g status-right $tm_status_right

set -g status-left-style fg=$color_light
set -g status-right-style fg=$color_light

set-window-option -g window-status-fg $color_light
set -g window-status-format "#[fg=$color_light,bold,bg=$color_midgrey][ #I: #W ]"

set-window-option -g window-status-current-format "#[fg=$color_white,bold,bg=$color_darkgrey][ #I: #W ]#[bg=$color_darkgrey]"

