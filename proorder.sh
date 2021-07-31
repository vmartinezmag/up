#!/bin/bash
ports=$(lsof -ti:8080 | wc -l)

if [ $ports != 0 ];
then
    kill $(lsof -ti:8080)
else
    URL_A=$(find /Applications/MAMP/htdocs/ -type d -name "proorder")

    cd ~
    cd $URL_A
    php artisan serve --port 8080 &
fi