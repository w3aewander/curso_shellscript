#!/bin/bash
#
#

clear

dados=$(cat /etc/passwd|grep -v '_'|sort|cut -d':' -f1,3,6)

echo  "-------------------------------------------"
echo  "         Usuario e seus diretorios         "
echo  "-------------------------------------------"
echo  

echo  "USUARIOS      DIRETORIO"

let qtde_usuarios=0

for linha in $dados
do
    usuario="$( echo $linha|cut -d':' -f1)"
        uid="$( echo $linha|cut -d':' -f2)"
  diretorio="$( echo $linha|cut -d':' -f3)"

  [ ${uid} -ge 1000 ] && [ ${uid} -ne 65534 ]  && \
    echo  "$usuario                   $diretorio" && \
    qtde_usuarios=$(( $qtde_usuarios + 1 ))

done

echo 

echo "Qtde Usuarios: $qtde_usuarios"
