#!/bin/sh
wget http://lorempixel.com/`xwininfo -root | grep Width | sed -r 's/(.*: )([0-9]*)/\2/g'`/`xwininfo -root | grep Height | sed -r 's/(.*: )([0-9]*)/\2/g'` -O /tmp/bg.jpg
feh --bg-center /tmp/bg.jpg
rm /tmp/bg.jpg
