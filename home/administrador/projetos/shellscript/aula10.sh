#!/bin/bash

clear

arquivo="/etc/passwd"

tput cup 3 3
usuarios_diretorios=$(cat $arquivo|grep -i ^[a-z] | sort|grep -v "for"|tr a-z A-Z )
printf "USUÁRIOS E SEUS DIRETÓRIOS DO SISTEMA LINUX\n"
printf  "\e[1;4;7;10m%-20s\e[0m|\e[1;4;7;10m%-30s\e[0m\n"  "USUARIOS" "DIRETORIOS"

for u in $usuarios_diretorios; do
  
   usuario=$( echo $u|cut -d':' -f1 )
   udir=$( echo $u|cut -d':' -f6 )

   printf  "\e[1;4;10m%-20s\e[0m|\e[4;33m%-30s\e[0m\n"  "$usuario" "$udir"
   
done

echo -e "\n"
#fim