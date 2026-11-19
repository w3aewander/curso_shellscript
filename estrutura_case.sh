#!/bin/bash
# Estrutura Case

read -p "Escolha a opção 1, 2 ou 3:" opcao

#case $opcao in
#   1) echo "Você escolheu a opção 1";;
#   2) echo "Você escolheu a opção 2";;
#   3) echo "Você escolheua opção 3";;
#   *) echo "A opção escolhida não está disponível";;
# esac

 
# Outra forma...
case $opcao in
  1|2) echo "Ok, você escolheu um ou dois";;
    3) echo "Você escolheu a opção 3";;
    *) echo "Opção não disponível";;
esac
