#!/bin/bash
#
# Contoh file penggunaan alias bash-in-bahasa.

# Perintah ini wajib disertakan agar alias dikenali
shopt -s expand_aliases

# Asumsi anda menjalankan sample script ini dari root direktori bash-in-bahasa
# $ bash samples/tebak-angka.sh
. ./bash-in-bahasa.sh

maksimal_percobaan=3
angka_minimum=1
angka_maksimum=15
jawaban_pengguna="salah"
percobaan=1
# Lihat https://stackoverflow.com/questions/8988824/generating-random-number-between-1-and-10-in-bash-shell-script
jawaban=$(( ($RANDOM % $angka_maksimum) + 1 ))

tulis '**********************************'
tulis 'SELAMAT DATANG DI GAME TEBAK ANGKA'
tulis '**********************************'
tulis "Kamu harus menebak angka yang muncul maksimal ${maksimal_percobaan} kali percobaan.
Angka berada diantara ${angka_minimum} dan ${angka_maksimum}. Selamat bermain!"

tulis
tulis -n '> Masukkan nama kamu: '
baca_input nama_pengguna

tulis

selama (( $percobaan <= $maksimal_percobaan ))
lakukan
    tulis -n "> #${percobaan} Masukkan angka: "
    baca_input jawaban_pengguna

    jika [ $jawaban = $jawaban_pengguna ];
    maka
        tulis "Selamat ${nama_pengguna}, jawaban kamu BENAR!"
        keluar 0
    akhir_jika

    percobaan=$(( $percobaan + 1 ))
selesai

tulis "GAME OVER. Ooops kamu sudah melakukan ${maksimal_percobaan} kali percobaan."
keluar 1