#!/bin/bash
ports=$(lsof -ti:8080,8081,8082 | wc -l)

if [ $ports != 0 ];
then
    kill $(lsof -ti:8080,8081,8082)
else
    URL_A=$(find /Applications/MAMP/htdocs/ -type d -name "proorder")
    URL_B=$(find /Applications/MAMP/htdocs/ -type d -name "gestor_ana")
    URL_C=$(find /Applications/MAMP/htdocs/ -type d -name "subastas_ana")

    cd ~
    cd $URL_A
    php artisan serve --port 8080 &
    cd ~
    cd $URL_B
    php artisan serve --port 8081 &
    cd ~
    cd $URL_C
    php artisan serve --port 8082 &
fi