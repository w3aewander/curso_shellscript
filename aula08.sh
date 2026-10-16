#!/bin/bash

# Objetivo:
# Obter informações básicas sobre memória, espaço em disco e  CPU

# Informações da memória RAM
ram=$(cat /proc/meminfo|head -n 3|awk -F ":"  '{print $1 $2}')

# Quantidade de processadores
qtde_processadores=$(cat /proc/cpuinfo|grep -i 'processor'|wc -l)

# Informação dos processadores
cpuinfo=$(cat /proc/cpuinfo|grep -i 'processor'|head -n 4)

# Informações do espaço em disco
disco=$(fdisk -l /dev/sdc|head -n 1)

# lipar a tela

#echo $(( $(fdisk -l -s /dev/sdc) / (1024 * 1024 * 1024) )) TB

clear

printf "%s\n" "INFORMAÇÕES BÁSICAS DO SISTEMA" 
printf "%s\n" "------------------------------"
printf "%s\n" "$ram" 
printf "Quantidade de processadores: %d\n" "$qtde_processadores"
printf "%s\n" "$cpuinfo"
printf "%s\n" "$disco"
printf "%s\n" "------------------------------"
printf "%s\n" "fim"
