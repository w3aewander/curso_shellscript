#!/bin/bash


ano_atual=`date "+%Y"`

echo -n "Digite o seu nome: "; read nome

echo "Olá $nome, prazer em te conhecer!"
echo
echo -n "Digite sua idade: "; read idade
echo
ano_nascimento=$[ $ano_atual - $idade ]

echo "$nome você informou que tem $idade anos de idade"
echo "então você nasceu no ano de $ano_nascimento."

