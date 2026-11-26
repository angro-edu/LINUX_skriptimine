#!/bin/bash
# Leiab kõik õnnenumbrid vahemikus 1000-9999 (korduv ristsumma = 7)

# Välimine tsükkel käib läbi kõik arvud vahemikus 1000 kuni 9999
for (( arv=1000; arv<=9999; arv++ ))
do
    # Säilitame algse arvu muutmiseks ajutises muutujas
    ajutine=$arv

    # Kordame numbrite liitmist seni, kuni tulemus on ühekohaline (> 9)
    while [ $ajutine -gt 9 ]
    do
        summa=0

        # Eraldame arvutuslikult iga numbri ja liidame need kokku
        while [ $ajutine -gt 0 ]
        do
            viimane_number=$(( ajutine % 10 ))
            summa=$(( summa + viimane_number ))
            ajutine=$(( ajutine / 10 ))
        done

        # Uus kontrollitav arv on saadud numbrite summa
        ajutine=$summa
    done

    # Kui ühekohaline lõpptulemus on 7, väljastame algse arvu
    if [ $ajutine -eq 7 ]; then
        echo $arv
    fi
done

