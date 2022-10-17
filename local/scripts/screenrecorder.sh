#!/bin/sh

pid=$(pgrep wf-recorder)

if [ -z $pid ]; 
then 
  case "$1" in
    "region")
      wf-recorder -g "$(slurp)" -f "$(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')"
      ;;
    "focused")
      wf-recorder -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" -f "$(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')"
      ;;
    "screen" | *)
      wf-recorder -g "$(slurp -f %o -o)" -f "$(xdg-user-dir VIDEOS)/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')"
      ;;
  esac;
else 
  pkill -2 wf-recorder
fi;
