# Tentang Bash dalam Bahasa Indonesia

Project bash-in-bahasa adalah project for fun untuk menterjemahkan beberapa kata kunci dalam Bash shell kedalam Bahasa Indonesia. Sehingga ketika kita berinteraksi dengan shell atau menulis shell script kita dapat menggunakan kata yang ada dalam Bahasa Indonesia.

* [Penggunaan](#penggunaan)
* [Contoh-contoh](#contoh-contoh)
* [Kekurangan](#kekurangan)
* [Kontribusi Bahasa Lain](#kontribusi-bahasa-lain)
* [Penulis](#penulis)
* [Lisensi](#lisensi)

## Penggunaan

Untuk menjalankan cukup impor file bash-in-bahasa.sh dan Bash dalam Bahasa Indonesia siap digunakan.

```
$ git clone git@github.com:rioastamal/bash-in-bahasa.git
$ cd bash-in-bahasa
```

Kita dapat menggunakan perintah source atau `.` titik untuk impor file.

```
$ source bash-in-bahasa.sh
$ tulis "Halo Dunia"
Halo Dunia
```

Contoh lain.

```
$ untuk (( i=1; i<=5; i++ ))
> lakukan
>   tulis "Baris: ${i}"
> selesai
Baris: 1
Baris: 2
Baris: 3
Baris: 4
Baris: 5
```

Jika menggunakan bash-in-bahasa pada Shell script kamu perlu menggunakan opsi `shopt -s expand_aliases` agar alias bash-in-bahasa digunakan.

```
#!/bin/bash
shopt -s expand_aliases

# Panggil alias bash-in-bahasa
source ./bash-in-bahasa.sh

# Alias Bahasa Indonesia sekarang bisa digunakan
tulis 'Hello World'
```

## Contoh-contoh

Kamu dapat melihat beberapa contoh yang sudah dibuat pada direktori `samples/`. Ini adalah contoh game tebak angka sederhana yang disertakan dalam kode sumber repo ini.

```bash
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
```

Cara menjalankannya.

```
$ bash samples/tebak-angka.sh
**********************************
SELAMAT DATANG DI GAME TEBAK ANGKA
**********************************
Kamu harus menebak angka yang muncul maksimal 3 kali percobaan.
Angka berada diantara 1 dan 15. Selamat bermain!

> Masukkan nama kamu: Rio

> #1 Masukkan angka: 3
> #2 Masukkan angka: 6
> #3 Masukkan angka: 1
GAME OVER. Ooops kamu sudah melakukan 3 kali percobaan.
```

## Kekurangan

Terdapat kekurangan dalam bash-in-bahasa yaitu tidak berfungsinya perulangan `for...in...`. Harusnya alias tersebut dapat ditulis `untuk...dalam...` tetapi entah kenapa Bash tidak bisa melakukan interpretasi.

```
$ source bash-in-bahasa.sh
$ untuk i dalam 1 2 3
-bash: syntax error near unexpected token `dalam'
```

## Kontribusi Bahasa Lain

Penulis terbuka untuk membuka kontribusi dalam bahasa lain misal `bash-in-jawa` atau `bash-in-sunda` dan lain-lain. Silahkan submit PR bahasa alias baru tersebut sesuai dengan contoh yang ada di `bahs-in-bahasa.sh`.

## Penulis

bash-in-bahasa dibuat oleh Rio Astamal &lt;rio@rioastamal.net&gt;

## Lisensi

Project ini dilisensikan dibawah naungan MIT License. Lihat file LICENSE.md.
