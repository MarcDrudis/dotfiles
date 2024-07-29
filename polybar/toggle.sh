#!/bin/bash

if pgrep -x "polybar"; then
    pkill polybar
    else
        polybar above &
        polybar bottom &
fi
