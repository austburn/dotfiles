#!/bin/bash

if [[ $(xrandr --query | grep "HDMI1 connected" -q) -eq 0 ]]; then
	ln -fs ~/.asoundrc.hdmi ~/.asoundrc
else
	ln -fs ~/.asoundrc.laptop ~/.asoundrc
fi

