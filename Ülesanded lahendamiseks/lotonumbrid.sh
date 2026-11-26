#!/bin/bash
# Genereerib 5 erinevat lotonumbrit vahemikus 1-50 ilma massiive kasutamata

# Loome unikaalse ajutise faili ja tühjendame selle
ajutine_fail=$(mktemp)

# Kordame seni, kuni ajutises failis on vähem kui 5 rida (numbrit)
while [ $(wc -l < "$ajutine_fail") -lt 5 ]
do
    # Genereerime juhusliku arvu vahemikus 1 kuni 50
    nr=$(( RANDOM % 50 + 1 ))

    # Kontrollime grep -x abil, kas täpselt selline number on juba failis
    if ! grep -qx "$nr" "$ajutine_fail"; then
        echo "$nr" >> "$ajutine_fail"
    fi
done

# Loeme numbrid ühele reale ja vormindame tulemuse koos kuupäevaga
numbrid=$(tr '\n' ' ' < "$ajutine_fail" | sed 's/ $//')
aeg=$(date "+%Y-%m-%d %H:%M:%S")
tulemus="[$aeg] Lotonumbrid: $numbrid"

# Kustutame ajutise faili
rm -f "$ajutine_fail"

# Küsime kasutajalt väljundi valikut
echo "Vali tegevus:"
echo "1) Kuva tulemus terminalis"
echo "2) Salvesta tulemus faili (lototulemused.txt)"
read -p "Sinu valik (1 või 2): " valik

if [ "$valik" == "1" ]; then
    echo "$tulemus"
elif [ "$valik" == "2" ]; then
    # >> lisab uue rea faili lõppu ega kirjuta varasemaid tulemusi üle
    echo "$tulemus" >> lototulemused.txt
    echo "Tulemus salvestatud faili lototulemused.txt!"
else
    echo "Vigane valik! Kuvame tulemuse terminalis:"
    echo "$tulemus"
fi

