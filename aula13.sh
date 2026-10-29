#!/bin/bash
#
# Shell Script com parâmetros
#

#$0, $1, $2, $3,...,$n

if [ -z "$1" ]; then

  echo "Você deve fornecer um parâmetro"
  exit 1;

fi

nome="$1"

if [[ "$1" == "--help"  ||  "$1" == "--help" ]]; then
    echo "Aqui vai a ajuda do sistema porque você digitou --help"
elif [[ "$1" == "data" || "$1" == "Data" ]]; then
    echo "A data de hoje é:  $( date '+%d-%m-%Y' )"
elif [[ "$1" == "Hora"  ||  "$1" == "hora" ]]; then
    echo "A hora atual é: $( date '+%H:%M:%S')"
else 
    echo "Recurso não implementado"
fi




