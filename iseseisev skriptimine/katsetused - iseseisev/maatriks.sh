#!/bin/bash

# Peidame kursori ja puhastame ekraani
tput civis
clear

# Taastame kursori ja värvid, kui kasutaja vajutab Ctrl+C
trap "tput cnorm; tput sgr0; clear; exit" SIGINT SIGTERM

# Terminali mõõtmed
veerud=$(tput cols)
read=$(tput lines)

# Massiiv, mis hoiab iga veeru "vihmapiisa" hetkeasukohta (rida)
declare -a tilgad
for (( i=0; i<veerud; i++ )); do
    tilgad[$i]=$(( RANDOM % read ))
done

# Tähemärgid, mida ekraanil kuvatakse
margid="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*"
margid_pikkus=${#margid}

# Lõputu tsükkel animatsiooni jaoks
while true; do
    for (( i=0; i<veerud; i+=2 )); do
        rida=${tilgad[$i]}
        
        # Valime juhusliku tähemärgi
        juhuslik_indeks=$(( RANDOM % margid_pikkus ))
        taht=${margid:$juhuslik_indeks:1}
        
        # Liigutame kursori õigesse kohta ja prindime helerohelise (peaaegu valge) "pea"
        tput cup $rida $i
        echo -ne "\e[1;37m$taht\e[0m"
        
        # Muudame eelmise tähemärgi tumeroheliseks
        eelmine_rida=$(( (rida - 1 + read) % read ))
        tput cup $eelmine_rida $i
        echo -ne "\e[0;32m$taht\e[0m"
        
        # Kustutame saba lõpu, et tekiks langeva tilga efekt
        kustuta_rida=$(( (rida - 12 + read) % read ))
        tput cup $kustuta_rida $i
        echo -ne " "
        
        # Liigutame tilka ühe rea võrra allapoole
        tilgad[$i]=$(( (rida + 1) % read ))
    done
    
    # Väike paus, et animatsioon oleks sujuv
    sleep 0.04
done

