#!/bin/bash

# NOTE: Launches the docker container with display forwarding

xhost +SI:localuser:$(whoami) >/dev/null 2>&1
# xhost +local:docker

docker run --rm \
  --env DISPLAY=$DISPLAY \
  --volume /tmp/.X11-unix:/tmp/.X11-unix \
  --volume "$HOME/.config/Webull Desktop":"/home/webull/.config/Webull Desktop" \
  --volume "$HOME/.local/share/Webull Desktop":"/home/webull/.local/share/Webull Desktop" \
  webull:latest
