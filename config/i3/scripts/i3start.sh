i3-msg exec 'urxvtc -name dropdown_term -e bash -c "tmux new-session"'
sleep 1
i3-msg '[instance="dropdown_term"] floating enable'
i3-msg '[instance="dropdown_term"] move scratchpad'

