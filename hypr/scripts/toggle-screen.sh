#!/bin/bash


if pgrep hyprlock > /dev/null; then
    # we are locked → allow toggle
    if hyprctl monitors | grep -q "dpmsStatus: 1"; then
        hyprctl dispatch dpms off
    else
        hyprctl dispatch dpms on
    fi
fi


