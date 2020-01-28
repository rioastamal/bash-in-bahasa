#!/bin/bash
#
# List of alias of Bash keywords in Bahasa Indonesia
#
# @author Rio Astamal <rio@rioastamal.net>
# @license MIT

# Generated using `compgen -k`
alias jika=if
alias jk=if
alias maka=then
alias selain_itu=else
alias seltu=else
alias selain_itu_jika=elif
alias seltu_jika=elif
alias kaji=fi
alias akhir_jika=fi
alias kj=fi
alias kasus=case
alias hal=case
alias susak=esac
alias lah=esac
alias untuk=for
alias pilih=select
alias selama=while
alias sampai=until
alias lakukan=do
alias selesai=done
alias dalam=in
alias fungsi=function
alias waktu=time

# Generated using `compgen -b`
alias namalain=alias
alias proses_latar=bg
alias mengikat=bind
alias putus=break
alias berhenti=break
#builtin
alias pemanggil=caller
alias masuk=cd
alias perintah=command
#compgen
alias lengkap=complete
alias teruskan=continue
alias deklarasikan=declare
#dirs
alias pungkiri=disown
alias cetak=echo
alias tulis=echo
alias izinkan=enable
alias evaluasi=eval
alias eksekusi=exec
alias keluar=exit
#exporexport
alias salah=false
#fc
alias proses_depan=fg
alias ambilopsi=getopts
# hash
alias bantuan=help
alias riwayat=history
alias kerjaan=jobs
alias bunuh=kill
alias biarkan=let
alias lokal=local
# logout
# popd
alias cetakf=printf
# pushd
alias dir_sekarang=pwd
alias baca=read
alias baca_input=read
alias bacasaja=readonly
alias kembalikan=return
alias nilai_balik=return
alias tetapkan=set
alias geser_arg=shift
# shopt
alias sumber=source
alias tangguhkan=suspend
alias coba=test
alias akumulasi_waktu=times
alias jebakan=trap
alias benar=true
alias tipe=type
#typeset
#ulimit
#umask
alias hilangkan_namalain=unalias
alias jangan_tetapkan=unset
alias tunggu=wait

kursor_ke_atas()
{
    tulis -ne "\033[${1}A"
}

kursor_ke_bawah()
{
    tulis -ne "\033[${1}B"
}

kursor_ke_kanan()
{
    tulis -ne "\033[${1}C"
}

kursor_ke_kiri()
{
    tulis -ne "\033[${1}D"
}

bersihkan_layar()
{
    tulis -ne ""
}

bersihkan_baris()
{
    tulis -ne "\033[K"
}

tulis_bersih()
{
    tulis -ne "${1}\033[K"
}

letakkan_kursor()
{
    tulis -ne "\033[${1};${2}H"
}