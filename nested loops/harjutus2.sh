#!/bin/bash
# Pesastatud while-tsükkel: tärnidest kolmnurk

rida=1
while [ $rida -le 5 ]
do
    veerg=1
    while [ $veerg -le $rida ]
    do
        echo -n "* "
        ((veerg++))
    done
    echo ""
    ((rida++))
done
