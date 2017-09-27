#!/bin/bash

screens_connected=$(xrandr -q | grep -E "\bconnected\b" -c)

if [ "$screens_connected" -eq "2" ]; then
	/bin/bash ~/.config/hdmi_sound_toggle.sh
	/bin/bash ~/.screenlayout.sh
fi
