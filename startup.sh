#!/bin/bash

echo "starting up dock config..."
echo "--- --- --- --- --- --- ---"

print_funny(){
    if [[ $1 -gt 7 ]]
    then 
        echo -e "eldenring connection...\n"
    else
        echo -e "attempting connection...\n"
    fi
}

if lsusb | grep -q 'Lenovo 40AS' ;
then
    print_funny $(($RANDOM % 10 + 1 ))
    if xrandr | grep -q 'DP-3 connected' ; 
    then
        xrandr --output DP-3 --rotate right --mode 1920x1080 --rate 60.00 --left-of eDP-1
        xrandr --output DP-5 --mode 1920x1080 --rate 120.00 --left-of DP-3 --pos 0x840
        i3-msg '[workspace="1"]' move workspace to output DP-5
        i3-msg '[workspace="2"]' move workspace to output DP-3
    elif xrandr | grep -q 'DP-4 connected' ; 
    then
        xrandr --output DP-4 -rotate right --mode 1920x1080 --rate 60.00 --left-of eDP-1
        xrandr --output DP-7 --mode 1920x1080 --rate 120.00 --left-of DP-4 --pos 0x840
        i3-msg '[workspace="1"]' move workspace to output DP-7
        i3-msg '[workspace="2"]' move workspace to output DP-4
    fi
    fi

    i3-msg '[workspace="3"]' move workspace to output eDP-1
    i3-msg '[workspace="4"]' move workspace to output eDP-1
    echo "--- --- --- --- --- --- ---"
    echo "good job, things didn't end horribly wrong..."
else
    echo "either the dock is not connected or something else is fucked up..."
fi
setxkbmap -layout us,es,ru -option grp:alt_space_toggle

exit 0

