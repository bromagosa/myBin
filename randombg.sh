#!/bin/sh
error=1
until test $error = 0;
do
    url=`curl http://www.splashbase.co/api/v1/images/random | jq -r .large_url`
    wget $url -O /tmp/bg.jpg
    error=$?
done
feh --bg-fill /tmp/bg.jpg
rm /tmp/bg.jpg
