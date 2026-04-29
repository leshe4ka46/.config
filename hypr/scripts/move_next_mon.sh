#!/usr/bin/env bash

# get current workspace id
current_ws=$(hyprctl activeworkspace -j | jq '.id')

# get monitors
monitors=($(hyprctl monitors -j | jq -r '.[].name'))

# get current monitor
current_mon=$(hyprctl activeworkspace -j | jq -r '.monitor')

# find index of current monitor
for i in "${!monitors[@]}"; do
  if [[ "${monitors[$i]}" == "$current_mon" ]]; then
    current_index=$i
    break
  fi
done

# next monitor (cycle)
next_index=$(( (current_index + 1) % ${#monitors[@]} ))
next_mon=${monitors[$next_index]}

# move workspace
hyprctl dispatch moveworkspacetomonitor "$current_ws" "$next_mon"
