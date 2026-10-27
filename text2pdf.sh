#!/bin/bash
#
#
#
#Instalar o pacote tcm se ainda não estiver instalado

arquivo=$1


#echo $arquivo; exit 1

if [ ! -e $arquivo ]; then
   echo "Arquivo $arquivo não existe."
   exit 1
fi

text2ps "$arquivo" > "$arquivo.ps"

ps2pdf "$arquivo.ps" 

firefox "$arquivo.pdf"
