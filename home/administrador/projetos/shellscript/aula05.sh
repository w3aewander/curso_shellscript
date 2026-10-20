#!/bin/bash
#
#

clear

tput cup  4 5; echo "--------------------------------------" 
tput cup  5 5; echo "       FICHA TÉCNICA                  "
tput cup  6 5; echo "--------------------------------------"
tput cup  7 5; echo " NOME....:                            "
tput cup  8 5; echo " IDADE...:                            "
tput cup  9 5; echo " PESO....:                            "
tput cup 10 5; echo " ALTURA..:                            "
tput cup 11 5; echo " IMC.....:                            "
tput cup 12 5; echo "--------------------------------------"
tput cup 13 5; echo " Informe os dados na posição do cursor"
tput cup 14 5; echo "--------------------------------------"

tput cup 7 15; read nome
tput cup 8 15; read idade
tput cup 9 15; read peso
tput cup 10 15; read altura

imc=$( echo "scale=2;$peso/($altura^2)"|bc )

tput cup  11 15; printf "%.2f" "$imc"
tput cup  15  5; echo "Fim"


read fim > /dev/null


