#!/bin/bash
#
# snake_case: ola_mundo
# camel_case: olaMundo
# pascal_case: OlaMundo
#

#Parâmetros:
# $0, $1, $2,...,$n
# onde $0 é o nome do programa ou módulo
#
diga_ola(){

  let ano_atual="$(date '+%Y')"
  let idade=$2
  
  nome="$1"
  ano_nascimento="$(($ano_atual - $idade))"

  echo "Olá $nome! "

  if [ -z $idade ]; then
    echo "Você não informou sua idade."
  else 
    echo "Você informou que tem ${idade} anos de idade"
    echo "Então você nasceu no ano de ${ano_nascimento}"
  fi

}

info_memoria(){

  info="$( cat /proc/meminfo|head -n 3)"

  echo "$info"

}

info_memoria_v2(){
  mem_total="$(cat /proc/meminfo|grep -i memtotal|cut -d':' -f2)"
  mem_free="$(cat /proc/meminfo|grep -i memfree|cut -d':' -f2)"
  mem_available="$(cat /proc/meminfo|grep -i memavailable|cut -d':' -f2)"

  mostrar_info_memoria "${mem_total}" "${mem_free}"  "${mem_available}"
}

# Formata adequadamente a informação para exibir no terminal
mostrar_info_memoria(){
 
  info_memoria_cabecalho

  mem_total="$1"
  mem_free="$2"
  mem_available="$3"

  echo "Memória total.......: ${mem_total}"
  echo "Memória livre.......: ${mem_free}"
  echo "Memória disponível..: ${mem_available}"
   
}


info_memoria_cabecalho(){
   echo "====================="
   echo -e "\e[1;31mEstado da Memória RAM\e[0m"
   echo "====================="

}

#diga_ola "Wanderlei" 62


info_memoria_v2


