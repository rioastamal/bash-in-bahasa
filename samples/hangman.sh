#!/bin/bash
#
# Hangman: sebuah permainan tebak kata sederhana dimana pemain harus
# menebak kata dengan benar dengan menyebutkan huruf satu per satu.
#
# Jika gagal maka gambar orang digantung (hangman) akan dimunculkan
shopt -s expand_aliases

DIR_SEKARANG=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_SEKARANG/../bash-in-bahasa.sh"

gambar_tulisan_hangman()
{
    tulis '##     ##    ###    ##    ##  ######   ##     ##    ###    ##    ##'
    tulis '##     ##   ## ##   ###   ## ##    ##  ###   ###   ## ##   ###   ##'
    tulis '##     ##  ##   ##  ####  ## ##        #### ####  ##   ##  ####  ##'
    tulis '######### ##     ## ## ## ## ##   #### ## ### ## ##     ## ## ## ##'
    tulis '##     ## ######### ##  #### ##    ##  ##     ## ######### ##  ####'
    tulis '##     ## ##     ## ##   ### ##    ##  ##     ## ##     ## ##   ###'
    tulis '##     ## ##     ## ##    ##  ######   ##     ## ##     ## ##    ##'
    tulis
}

bersihkan_hangman()
{
    tulis_bersih ""
    untuk (( baris=1; baris<=7; baris++ )); lakukan
        tulis_bersih "\n"
    selesai
    kursor_ke_atas 7
}

gambar_hangman()
{
    bersihkan_hangman

    jika [ $1 = 0 ]; maka
        tulis -e "\n\n\n\n\n\n\n"
        kembalikan 0
    akhir_jika

    jika [ $1 = 1 ]; maka
        tulis -e "\n"
        tulis "                                    O"
        tulis "                                    |"
        tulis -e "\n\n\n"
        kembalikan 0
    akhir_jika

    jika [ $1 = 2 ]; maka
        tulis -e "\n"
        tulis "                                    O "
        tulis "                                   /|\ "
        tulis -e "\n\n\n"
        kembalikan 0
    akhir_jika

    jika [ $1 = 3 ]; maka
        tulis -e "\n"
        tulis "                                    O "
        tulis "                                   /|\ "
        tulis "                                   / \ "
        tulis -e "\n\n"
        kembalikan 0
    akhir_jika

    jika [ $1 = 4 ]; maka
        tulis "                                    + "
        tulis "                                    | "
        tulis "                                    O "
        tulis "                                   /|\ "
        tulis "                                   / \ "
        tulis -e "\n\n"
        kembalikan 0
    akhir_jika

    tulis "                          [|]=======+ "
    tulis "    +------+              [|]       | "
    tulis "    | GAME |              [|]       @ "
    tulis "    | OVER |              [|]      /|\ "
    tulis "    +------+              [|]      / \ "
    tulis "                          [|] "
    tulis "                          [|] "
    tulis "                          === "
}

gambar_kemenangan()
{
   bersihkan_hangman

    tulis "    +---------+  ''''''' "
    tulis "    | KAMU    |    \O/ "
    tulis "    | MENANG! |     | "
    tulis "    +---------+    / \ "
    tulis "                 -------"
    tulis ""
    tulis ""
}

tulis_garis_bawah()
{
    lokal jumlah_huruf=${#1}
    lokal huruf_dicari=
    lokal akhiran=" "

    jika [ "$2" = "kosong" ]; maka
        akhiran=""
    akhir_jika

    untuk (( garis=0; garis<$jumlah_huruf; garis++ ))
    lakukan
        jika [ "$huruf_benar" = "" ]; maka
            tulis -n "__${akhiran}"
            teruskan
        akhir_jika

        # Tes apakah huruf ada string jawaban
        # @lihat https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
        huruf_dicari=${1:$garis:1}
        jika [ -z "${huruf_benar##*$huruf_dicari*}" ]; maka
            tulis -n "${huruf_dicari}${akhiran}"
            teruskan
        akhir_jika

        tulis -n "__${akhiran}"
    selesai
}

adakah_huruf_dalam()
{
    lokal kata_sumber=$1
    lokal huruf_dicari=$2

    jika [ -z "${kata_sumber##*$huruf_dicari*}" ]; maka
        tulis 'ya'
        kembalikan 0
    akhir_jika

    tulis 'tidak'
    kembalikan 1
}

kembalikan_nilai_awal()
{
    jawaban="$( acak_jawaban )"
    jawaban_pengguna=""
    huruf_benar=""
    percobaan=0
}

acak_jawaban()
{
    # Daftar negara dan ibu kota
    lokal daftar_jawaban=( AFGHANISTAN ALBANIA ALJAZAIR ANDORRA ANGOLA ANTIGUA-DAN-BARBUDA ARGENTINA ARMENIA AUSTRALIA AUSTRIA AZERBAIJAN BAHAMA BAHRAIN BANGLADESH BARBADOS BELARUS BELGIA BELIZE BENIN BHUTAN BOLIVIA BOSNIA-HERZEGOVINA BOTSWANA BRASIL BRUNEI-DARUSSALAM BULGARIA BURKINA-FASO BURUNDI KAMBOJA KAMERUN KANADA CAPE-VERDE AFRIKA-TENGAH CHAD CHILE CINA KOLOMBIA KOMORO KONGO KOSTA-RIKA PANTAI-GADING KROASIA KUBA SIPRUS REPUBLIK-CEKO DENMARK DJIBOUTI DOMINIKA REPUBLIK-DOMINIKA TIMOR-LESTE EKUADOR MESIR EL-SALVADOR GUINEA-EKUATORIAL ERITREA ESTONIA ETHIOPIA FIJI FINLANDIA PRANCIS GABON GAMBIA GEORGIA JERMAN GHANA YUNANI GRENADA GUATEMALA GUINEA GUINEA-BISSAU GUYANA HAITI HONDURAS HONGARIA ISLANDIA INDIA INDONESIA IRAN IRAK IRLANDIA ISRAEL ITALIA JAMAIKA JEPANG YORDANIA KAZAKHSTAN KENYA KIRIBATI KOREA-UTARA KOREA-SELATAN KUWAIT KYRGYZSTAN LAOS LATVIA LEBANON LIBYA LIECHTENSTEIN LUXEMBOURG MACEDONIA MADAGASKAR MALAWI MALAYSIA MALADEWA MALI MALTA KEPULAUAN-MARSHALL MAURITANIA MAURITIUS MEKSIKO FEDERASI-MIKRONESIA MOLDOVA MONAKO MONGOLIA MONTENEGRO MAROKO MOZAMBIK MYANMAR NAMIBIA NAURU NEPAL BELANDA SELANDIA-BARU NIKARAGUA NIGER NIGERIA NORWEGIA OMAN PAKISTAN PALAU PANAMA PAPUA-NUGINI PARAGUAY PERU FILIPINA POLANDIA PORTUGAL QATAR ROMANIA RUSIA RWANDA SAINT-KITTS-DAN-NEVIS SAINT-LUCIA SAINT-VINCENT-DAN -GRENADINES SAMOA SAN-MARINO SAO-TOME-DAN-PRINCIPE ARAB-SAUDI SENEGAL SERBIA SEYCHELLES SIERRA-LEONE SINGAPURA SLOVAKIA SLOVENIA KEPULAUAN-SOLOMON SOMALIA AFRIKA-SELATAN SPANYOL SRI-LANKA SUDAN SURINAME SWAZILAND SWEDIA SWISS SURIAH TAJIKISTAN TANZANIA THAILAND TOGO TONGA TRINIDAD-DAN-TOBAGO TUNISIA TURKI TURKMENISTAN TUVALU UGANDA UKRAINA UNI-EMIRAT-ARAB INGGRIS AMERIKA-SERIKAT URUGUAY UZBEKISTAN VANUATU VATIKAN VENEZUELA VIETNAM YAMAN ZAMBIA ZIMBABWE KABUL TIRANA ALJIR ANDORRA-LA-VELLA LUANDA SAINT-JOHNS BUENOS-AIRES YEREVAN CANBERRA WINA BAKU NASSAU MANAMA DHAKA BRIDGETOWN MINSK BRUSSEL BELMOPAN PORTO-NOVO THIMPHU LA-PAZ SARAJEVO GABORONE BRASILIA BANDAR-SERI-BEGAWAN SOFIA OUAGADOUGOU BUJUMBURA PHNOM-PENH YAOUNDE OTTAWA PRAIA BANGUI NDJAMENA SANTIAGO BEIJING BOGOTA MORONI BRAZZAVILLE SAN-JOSE ABIJAN ZAGREB HAVANA NIKOSIA PRAHA KOPENHAGEN DJIBOUTI ROSEAU SANTO-DOMINGO DILI QUITO KAIRO SAN-SALVADOR MALABO ASMARA TALLINN ADDIS-ABABA SUVA HELSINKI PARIS LIBREVILLE BANJUL TBILISI BERLIN AKRA ATHENA SAINT-GEORGE GUATEMALA-CITY CONAKRY BISSAU GEORGETOWN PORT-AU-PRINCE TEGUCIPALGA BUDAPEST REYKJAVIK NEW-DELHI JAKARTA TEHERAN BAGHDAD DUBLIN TEL-AVIV ROMA KINGSTON TOKYO AMMAN ASTANA NAIROBI TARAWA PYONGYANG SEOUL KUWAIT-CITY BISHKEK VIENTIANE RIGA BEIRUT TRIPOLI VADUZ LUXEMBOURG SKOPJE ANTANANARIVO LILONGWE KUALA-LUMPUR MALE BAMAKO MALTA MAJURO NOUAKCHOTT PORT-LOUIS MEXICO-CITY PALIKIR CHISINAU MONAKO ULAN-BATOR PODGORICA RABAT MAPUTO NAYPYIDAW WINDHOEK KATHMANDU AMSTERDAM WELLINGTON MANAGUA NIAMEY ABUJA OSLO MUSKAT ISLAMABAD KOROR PANAMA-CITY PORT-MORESBY ASUNCION LIMA MANILA WARSAWA LISABON DOHA BUCHAREST MOSKOW KIGALI BASSETERRE CASTRIES KINGSTOWN APIA SAN-MARINO SAO-TOME RIYADH DAKAR BEOGRAD VICTORIA FREETOWN SINGAPURA BRATISLAVA LJUBLJANA HONIARA MOGADISHU PRETORIA MADRID KOLOMBO KHARTOUM PARAMARIBO MBABANE STOCKHOLM BERN DAMASKUS DUSHANBE DAR-ES-SALAAM BANGKOK LOME NUKUALOFA PORT-OF-SPAIN TUNIS ANKARA ASHGABAT FUNAFUTI KAMPALA KIEV ABU-DHABI LONDON WASHINGTON-DC MONTEVIDEO TASHKENT PORT-VILA VATIKAN CARACAS HANOI SANAA LUSAKA HARARE )
    lokal total_jawaban=$( echo ${#daftar_jawaban[@]} )
    lokal indeks=$(( ($RANDOM % $total_jawaban) + 1 ))

    echo ${daftar_jawaban[$indeks]}
}

maksimal_percobaan=5
jawaban="$( acak_jawaban )"
jawaban_pengguna=""
huruf_benar=""
percobaan=0

gambar_tulisan_hangman

# Perulangan utama
selama benar :
lakukan
    tulis -ne "\r"
    gambar_hangman $percobaan

    tulis -e "Petunjuk: Nama negara atau ibu kota. Jika spasi ganti dengan tanda \"-\".\n"
    tulis_bersih ""
    tulis_garis_bawah "$jawaban"

    tulis -e  "\n"
    tulis_bersih "Masukkan satu huruf (KAPITAL): "
    tulis_bersih "\n"

    jika [ "$jawaban_pengguna" = "$jawaban" ]; maka
        kursor_ke_atas 13
        gambar_kemenangan
        kursor_ke_bawah 5
        tulis -ne "\n>> Tekan ENTER untuk permainan baru atau CTRL+C untuk keluar."

        baca_input huruf

        kembalikan_nilai_awal
        kursor_ke_atas 14
        teruskan
    akhir_jika

    jika (( $percobaan > 0 )); maka
        tulis_bersih "Gagal ke-$(( ${percobaan} )) dari ${maksimal_percobaan}."
    akhir_jika

    kursor_ke_atas 1

    # reset kursor ke paling kiri sebelum digeser kenanan
    tulis -ne "\r"
    kursor_ke_kanan 31

    jika (( $percobaan >= $maksimal_percobaan )); maka
        percobaan=0
        kursor_ke_atas 2
        tulis_bersih "\n\nKamu sudah ${maksimal_percobaan} kali GAGAL. Jawaban yang benar adalah: ${jawaban}.\n"
        tulis_bersih "Tekan ENTER untuk melanjutkan atau CTRL+C untuk keluar."

        baca_input huruf

        kembalikan_nilai_awal
        kursor_ke_atas 14
        teruskan
    akhir_jika

    # IFS digunakan agar baca_input a.k.a read tidak melakukan trimming whitespace
    # lihat https://unix.stackexchange.com/a/18889
    selama IFS= baca_input -n1 huruf; lakukan
        break;
    selesai

    jika [ "$huruf" = "" ]; maka
        kursor_ke_atas 13 && teruskan
    akhir_jika

    jika [ "$huruf" = " " ]; maka
        kursor_ke_atas 12 && teruskan
    akhir_jika

    jika [ "$( adakah_huruf_dalam "$jawaban" "$huruf" )" = "ya"  ]; maka
        # masukkan huruf ke tampungan jawaban
        jika [ "$huruf_benar" = "" ]; maka
            huruf_benar="$huruf"
        akhir_jika

        jika [ "$( adakah_huruf_dalam "$huruf_benar" "$huruf" )" = "tidak" ]; maka
            huruf_benar="${huruf_benar}${huruf}"
        akhir_jika

        jawaban_pengguna="$( tulis_garis_bawah "$jawaban" "kosong" )"
        kursor_ke_atas 12
        teruskan
    akhir_jika

    percobaan=$(( $percobaan + 1 ))

    kursor_ke_atas 12
selesai