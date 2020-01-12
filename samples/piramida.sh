#!/bin/bash
#
# Contoh file penggunaan alias bash-in-bahasa.

# Perintah ini wajib disertakan agar alias dikenali
shopt -s expand_aliases

# Asumsi anda menjalankan sample script ini dari root direktori bash-in-bahasa
. ./bash-in-bahasa.sh

tulis 'Piramida 1'
tulis '=========='
untuk (( baris=1; baris<=5; baris++ ))
lakukan

    untuk (( kolom=1; kolom<=$baris; kolom++ ))
    lakukan
        tulis -n '* '
    selesai

    tulis
selesai

tulis
tulis 'Piramida 2'
tulis '=========='
baris=5
selama (( $baris >= 1 ))
lakukan
    kolom=$baris
    selama (( $kolom >= 1 ))
    lakukan
        tulis -n '* '
        kolom=$(( $kolom - 1 ))
    selesai

    baris=$(( $baris - 1 ))
    tulis
selesai

tulis
tulis 'Piramida 3'
tulis '=========='

tulis -n 'Masukkan jumlah baris: '
read jumlah_baris

untuk (( baris=1; baris<=$jumlah_baris; baris++ ))
lakukan
    # Tulis spasi untuk padding kiri agar piramida dapat terlihat ketengah
    untuk (( spasi=1; spasi<=$(( $jumlah_baris - $baris )); spasi++ ))
    lakukan
        tulis -n ' '
    selesai

    untuk (( kolom=1; kolom<=$baris; kolom++ ))
    lakukan
        tulis -n '* '
    selesai

    tulis
selesai
