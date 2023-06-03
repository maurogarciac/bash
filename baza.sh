#!/bin/bash

echo "beep boop connecting to desktop"
echo "--- --- --- --- --- --- ---"

print_funny(){
    if [[ $1 -gt 7 ]]
    then 
        echo -e "eldenring connection...\n"
    else
        echo -e "attempting connection...\n"
    fi
}

print_funny $(($RANDOM % 10 + 1 ))
xrandr --output DisplayPort-2 --rotate right --mode 1920x1080 --rate 60.00 --left-of eDP
xrandr --output DisplayPort-4 --mode 1920x1080 --rate 120.00 --left-of DisplayPort-2

i3-msg '[workspace="1"]' move workspace to output DisplayPort-4
i3-msg '[workspace="2"]' move workspace to output DisplayPort-2
i3-msg '[workspace="3"]' move workspace to output eDP
i3-msg '[workspace="4"]' move workspace to output eDP

xrandr --output DisplayPort-3 --rotate right --mode 1920x1080 --rate 60.00 --left-of eDP
xrandr --output DisplayPort-6 --mode 1920x1080 --rate 120.00 --left-of DisplayPort-3
i3-msg '[workspace="1"]' move workspace to output DisplayPort-6
i3-msg '[workspace="2"]' move workspace to output DisplayPort-3


setxkbmap -layout us

echo "--- --- --- --- --- --- ---"
echo -e "connected!!!!     successs!!! \nyeaaahhhhh!! lets gooooo!!!\n"

exit 0