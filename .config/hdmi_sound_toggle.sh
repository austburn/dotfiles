#!/bin/bash
USER_NAME=$(w -hs | cut -d" " -f1)
USER_ID=$(id -u "$USER_NAME")
HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status)
SINKS=$(pactl list short sink-inputs | cut -d$'\t' -f1)

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

if [[ $HDMI_STATUS == connected ]]
then
   SINK="alsa_output.pci-0000_00_03.0.hdmi-stereo"
   #sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 0 output:hdmi-stereo
else
   SINK="alsa_output.pci-0000_00_1b.0.analog-stereo"
   #sudo -u "$USER_NAME" pactl --server "$PULSE_SERVER" set-card-profile 1 output:analog-stereo+input:analog-stereo
fi

for s in $SINKS; do
  pactl move-sink-input $s $SINK
done
