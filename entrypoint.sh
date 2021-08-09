#!/usr/bin/bash

useradd -m -u $UID -G wheel $USERNAME
printf "$VNC_PASSWORD\n$VNC_PASSWORD\n\n" | runuser -u $USERNAME vncpasswd
dbus-daemon --system --fork
runuser -u $USERNAME dbus-launch vncserver :0
