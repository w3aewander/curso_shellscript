#!/bin/bash
#Informe o nome e a idade
# snack case: obter_idade
# Pascal-case ObterIdade 
# Camel-case obterIdade
obter_idade() {

  #obtém o nome do módulo ou script executado
  modulo=$0

  #obtém nome e idade passado como parâmetro
  #$1 = o primeiro parâmetro após o nome do módulo
  #$2 = o segundo parâmetro após o nome do módulo
  nome=$1
  idade=$2
  ano_atual=$(date '+%Y')

  echo "Olá ${nome}, fui chamado pela módulo ${modulo}!"
  echo "Você informou que tem ${idade} anos de idade"
  echo "Então você nasceu em $((${ano_atual} - ${idade}))" 
}

info_memoria(){

   mem_total="$(cat /proc/meminfo|head -n 1)"
   mem_free="$(cat /proc/meminfo|head -n 2|tail -n 1)"
   mem_available="$(cat /proc/meminfo|head -3|tail -n 1)"

   #echo "Memória total.....: "$(echo $mem_total|cut -d':' -f2)""
   #echo "Memória livre.....: "$(echo $mem_free|cut -d':' -f2)""
   #echo "Memória disponĩ́vel: "$(echo $mem_available|cut -d':' -f2)""

  mostrar_info_memoria "${mem_total}" "${mem_free}"  "${mem_available}"
   
}

info_memoria_v2(){
  mem_total1="$(cat /proc/meminfo|grep -i MemTotal|cut -d':' -f2)"
  mem_free1="$(cat /proc/meminfo|grep -i MemFree|cut -d':' -f2)"
  mem_available1="$(cat /proc/meminfo|grep -i MemAvailable|cut -d':' -f2)"
  
  #echo "Memória total.....: "$(echo $mem_total1|cut -d':' -f2)""
  #echo "Memória livre.....: "$(echo $mem_free1|cut -d':' -f2)""
  #echo "Memória disponĩ́vel: "$(echo $mem_available1|cut -d':' -f2)""

  mostrar_info_memoria "${mem_total1}" "${mem_free1}"  "${mem_available1}"
}

mostrar_info_memoria(){

  res_mem_total="$1"
  res_mem_free="$2"
  res_mem_available="$3"
  
  echo "Memória total.....: "$(echo $res_mem_total|cut -d':' -f2)""
  echo "Memória livre.....: "$(echo $res_mem_free|cut -d':' -f2)""
  echo "Memória disponĩ́vel: "$(echo $res_mem_available|cut -d':' -f2)""

}

 #obter_idade "Wanderlei" 62

 echo
 echo "------------------"
 echo "Estado da memória:"
 echo "------------------"
 echo

 info_memoria
 echo -e "\n"

 info_memoria_v2
 echo -e "\n"


 
