#!/bin/bash

read -p "Sisesta kujundi laius (täisarv): " laius
read -p "Sisesta kujundi kõrgus (täisarv): " korgus

if ! [[ "$laius" =~ ^[1-9][0-9]*$ ]] || ! [[ "$korgus" =~ ^[1-9][0-9]*$ ]]; then
    echo "Viga: Palun sisesta positiivsed täisarvud."
    exit 1
fi

echo ""

for (( i=1; i<=korgus; i++ )); do
    for (( j=1; j<=laius; j++ )); do
        if (( i == 1 || i == korgus || j == 1 || j == laius )); then
            echo -n "*"
        else
            echo -n " "
        fi
    done
    echo ""
done

