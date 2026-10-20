#!/bin/bash

### Cálculo e decisões - usando expressões: aritméticas, relacionais e lógicas


#preco=8
#quantidade=3
#total=$((preco*quantidade))


#    Operadores aritméticos
# + soma             7 + 2
# - subtrações       7 - 2
# * Multiplicação    7 * 2
# / divisão          7 / 2 = 3
# % Módulo           7 % 3 = 1  
# ** potencia

# printf "O total calculado foi: %d\n" "$total"

#fim

# Precendencia e parênteses

# echo $(( (2 + 3) * 4 ))

# Operadores relacionais

# == igualdade    !=  diferente
# <  menor         > maior 
# <=  menor ou igual   >= maior ou igual

# echo $(( 18 >= 18 )) # verdadeiro => 1
# echo $(( 12 >= 18 )) # falso => 0

idade=18
if (( idade >= 18 )); then
  echo "Maior de idade"
else
  echo "Menor de idade"	
fi

# [ "$idade" -eq 18 ]  igual
# [ "$idade" -ne 18 ]  diferente
# [ "$idade" -lt 18 ]  menor 
# [ "$idade" -le 18 ]  menor ou igual
# [ "$idade" -gt 18 ]  maior
# [ "$idade" -ge 18 ]  maior ou igual

# Operadores lógicos

#idade=20
#pontos=75

# && - E (AND)
#if (( idade >= 18 && pontos >= 70 )); then
#  echo "Pode participar"	
#fi

tentativas=3
pontos=70
# || - OU (OR)
# if (( pontos >= 70 || tentativas < 3 )); then
#  echo "Ok.... entrada autorizada."	
# fi

# ! - NÃO  (NOT)

# idade=11
# if (( !(idade >= 12)  )); then
#   echo "Pode usar o parque porque você não tem idade igual ou superior a 12 anos"
   
# fi

numero=1000
if (( numero > 0 && numero % 2 == 0 )); then
    echo "Positivo e par"
else
    echo "Não atende à condição"
fi







read fim > /dev/null
