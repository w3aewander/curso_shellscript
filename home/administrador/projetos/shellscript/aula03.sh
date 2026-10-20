#!/bin/bash

# Caractes especificadores de formato e caracteres de escape

#pi=3.141516

#printf "%.2f\n" "$pi"

clear

linha=$(printf "%*s" 45 ''|tr ' ' '-' )

printf "%s\n" "$linha"
printf "%-25s  %-15s\n"  "NOME"  "CELULAR"
printf "%s\n" "$linha"
printf "%-25s  %-15s\n"  "Wanderlei"   "(88) 999999999"
printf "%-25s  %-15s\n"  "Wanderlei"   "(88) 999999999"
printf "%-25s  %-15s\n"  "Wanderlei"   "(88) 999999999"
printf "%-25s  %-15s\n"  "Wanderlei"   "(88) 999999999"

echo -e "\n\n\nPressione qualquer tecla para continuar...."

read >> /dev/null

clear

