#!/bin/bash
# Ruutvõrrandi Ax^2 + Bx + C = 0 lahendamine (kasutades awk-i)

export LC_NUMERIC=C

# 1. Kontrollime, et argumente on täpselt 3
if [ $# -ne 3 ]; then
    echo "Viga: Sisesta täpselt kolm kordajat (A, B ja C)!"
    echo "Kasutamine: $0 A B C"
    exit 1
fi

# 2. Teeme kontrollid ja arvutused awk sees
awk -v A="$1" -v B="$2" -v C="$3" 'BEGIN {
    if (A == 0) {
        print "Viga: Kordaja A ei tohi olla 0."
        exit 1
    }

    D = B^2 - 4 * A * C

    if (D < 0) {
        print "Reaalarvulised lahendid puuduvad."
    } else if (D == 0) {
        x = -B / (2 * A)
        printf "Üks lahend: x = %.5f\n", x
    } else {
        x1 = (-B + sqrt(D)) / (2 * A)
        x2 = (-B - sqrt(D)) / (2 * A)
        printf "Kaks lahendit: x1 = %.5f, x2 = %.5f\n", x1, x2
    }
}'

