#!/bin/bash
#
#

clear

dados=$(cat /etc/passwd|grep -v '_'|sort|cut -d':' -f1,3,6)

printf "%50s\n"  "-------------------------------------------"
printf "%50s\n"  "         Usuário e seus diretórios         "
printf "%50s\n"  "-------------------------------------------"
printf "%s\n"

printf "\e[1;33;4m%-30s\t\e[0m\e[1;33;4m%-30s\e[0m\n"  "USUÁRIO" "DIRETORIO"

let qtde_usuarios=0

for linha in $dados
do
  usuario="$( echo $linha|cut -d':' -f1 )"
  uid="$( echo $linha|cut -d':' -f2)"
  diretorio="$( echo $linha|cut -d':' -f3)"

  [ ${uid} -ge 1000 ] && [ ${uid} -ne 65534 ]  && \
    printf "\e[1m%-30s\t%-30s\e[0m\n" "$usuario"  "$diretorio" && \
    qtde_usuarios=$(( $qtde_usuarios + 1 ))

done

echo -e "\n"

printf "Qtde Usuários: %-30s\n\n\n" "$qtde_usuarios           " 

