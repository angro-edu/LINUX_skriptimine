#!/bin/bash
# break ja continue pesastatud tsüklites

for i in {1..4}
do
    echo "Välimine tsükkel: $i"
    for j in {1..4}
    do
        # Kui i on 2 ja j on 2, hüppame välimise tsükli järgmisele sammule
        if [ $i -eq 2 ] && [ $j -eq 2 ]; then
            echo "  -> Jätame ülejäänud sammud vahele (continue 2)"
            continue 2
        fi

        # Kui i on 4 ja j on 3, katkestame sisemise tsükli
        if [ $i -eq 4 ] && [ $j -eq 3 ]; then
            echo "  -> Katkestame sisemise tsükli (break)"
            break
        fi

        echo "  Sisemine tsükkel: $j"
    done
done

